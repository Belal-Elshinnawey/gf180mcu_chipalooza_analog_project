# SPDX-FileCopyrightText: 2026 Tim Edwards and Simon Dorrer
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
# Description: Sync the top schematic to one floorplan slot's wrapper: rename slot_<N>.sch, update
# its s<N>_an analog I/O pins, add any wrapper pin the schematic is missing, and regenerate
# slot_<N>.sym via xschem's make_symbol (_pex.sym comes from the existing 'make symbol-pex' target).
# Every pin stays its own ipin/opin/iopin instance, never collapsed into a bus. Slots 2/8 carry an
# extra real 'vss5v0' pin, slots 11/17 an extra real 'vss3v3' pin - not a wrapper-GDS typo. Pins the
# schematic has that the target wrapper doesn't are removed.

import argparse
import glob
import os
import re
import subprocess
import sys

SLOT_AN_RE = re.compile(r"^s(\d+)_an\[\d+\]$")
BIT_RE = re.compile(r"^(.+)\[(\d+)\]$")
RANGE_RE = re.compile(r"^(.+)\[(\d+):(\d+)\]$")
SCH_C_RE = re.compile(r"^C \{(ipin|opin|iopin)\.sym\} (-?\d+) (-?\d+) 0 0 \{name=(p\d+) lab=([^\}]+)\}$")

EXTERNAL_VSS_PINS = {
    "vss5v0": "external VSS pin (5V0 rail), present on this slot only",
    "vss3v3": "external VSS pin (3V3 rail), present on this slot only",
}


def wrapper_pin_set(kdb, gds_path, cell_name):
    """Return the set of individual pin text labels (e.g. 'dig_in[3]', 'clk') found in cell_name."""
    layout = kdb.Layout()
    layout.read(gds_path)
    cell = layout.cell(cell_name)
    if cell is None:
        print(f"[ERROR] {gds_path}: no cell '{cell_name}' found.", file=sys.stderr)
        sys.exit(1)
    labels = set()
    for index in layout.layer_indexes():
        for shape in cell.shapes(index).each():
            if shape.is_text():
                labels.add(shape.text_string)
    return labels


def strip_bus(name):
    """Strip a trailing bus subscript: 'dig_in[3]' -> 'dig_in'. Scalars are returned as-is."""
    m = BIT_RE.match(name)
    return m.group(1) if m else name


def infer_direction(base):
    if base in ("enable", "reset", "clk"):
        return "in"
    if base == "dig_in":
        return "in"
    if base == "dig_out":
        return "out"
    return "inout"


def column_for(direction, base):
    if direction == "in":
        return 0
    if direction == "out":
        return 400
    return 1200 if base.startswith(("vdd", "vss")) else 800


def an_prefix(labels):
    """Find the 's<N>_an' prefix among a set of pin labels, e.g. {'s2_an[0]', 's2_an[1]', ...} -> 's2_an'."""
    prefixes = {strip_bus(l) for l in labels if SLOT_AN_RE.match(l)}
    return prefixes


def parse_sch(text):
    """Return (header_lines, [{'kind','x','lab'}, ...]) - y/pin-number are recomputed, not kept."""
    header, instances = [], []
    for line in text.splitlines():
        m = SCH_C_RE.match(line)
        if m:
            instances.append({"kind": m.group(1), "x": int(m.group(2)), "lab": m.group(5)})
        elif not instances:
            header.append(line)
    return header, instances


def expand_and_relayout(instances):
    """Expand any leftover 'base[hi:lo]' bus instance into individual 'base[i]' pins, then assign
    a fresh non-overlapping y position and pin number per column, in list order."""
    expanded = []
    for inst in instances:
        m = RANGE_RE.match(inst["lab"])
        if m:
            base, hi, lo = m.group(1), int(m.group(2)), int(m.group(3))
            for idx in range(min(hi, lo), max(hi, lo) + 1):
                expanded.append({"kind": inst["kind"], "x": inst["x"], "lab": f"{base}[{idx}]"})
        else:
            expanded.append({"kind": inst["kind"], "x": inst["x"], "lab": inst["lab"]})

    col_next_y, num = {}, 1
    for inst in expanded:
        y = col_next_y.get(inst["x"], 0)
        inst["y"], inst["num"] = y, num
        col_next_y[inst["x"]] = y + 40
        num += 1
    return expanded


def render_sch(header, instances):
    lines = list(header)
    for inst in instances:
        lines.append(f"C {{{inst['kind']}.sym}} {inst['x']} {inst['y']} 0 0 "
                      f"{{name=p{inst['num']} lab={inst['lab']}}}")
    return "\n".join(lines) + "\n"


def generate_symbol(schem_dir, cellname):
    """Run xschem's own make_symbol on <cellname>.sch to (re)build <cellname>.sym.
    make_symbol hands its argument straight to make_sym.awk as the file to read, so it must be
    the .sch path itself (with extension) - 'xschem get current_name' resolves through the
    library search path and loses both the directory and the extension, so don't rely on it."""
    sch_path = os.path.join(schem_dir, f"{cellname}.sch")
    xschemrc = os.path.join(schem_dir, "xschemrc")
    cmd = [
        "xschem", "-r", "-x", "-q", "--rcfile", xschemrc,
        "--command", f"make_symbol {{{sch_path}}} yes",
        sch_path,
    ]
    print(f"[INFO] Running xschem make_symbol on {sch_path} ...")
    subprocess.run(cmd, check=True)


def main():
    parser = argparse.ArgumentParser(
        description="Sync the top slot_<N> schematic to one floorplan slot's wrapper pins, and "
                    "regenerate its symbol with xschem's make_symbol."
    )
    parser.add_argument("slot", type=int, help="slot number (matches floorplan/slot<N>_wrapper.gds)")
    parser.add_argument("--floorplan-dir", default="floorplan")
    parser.add_argument("--schem-dir", default="schematic/xschem")
    args = parser.parse_args()

    try:
        import klayout.db as kdb
    except ImportError:
        print("[ERROR] The klayout Python module is not available. Run this inside the "
              "IIC-OSIC-TOOLS container.", file=sys.stderr)
        return 2

    gds_path = os.path.join(args.floorplan_dir, f"slot{args.slot}_wrapper.gds")
    if not os.path.isfile(gds_path):
        print(f"[ERROR] {gds_path} not found. Run 'make pull-wrappers' first.", file=sys.stderr)
        return 1
    cell_name = f"slot{args.slot}_wrapper"

    print(f"[INFO] Reading pins from {gds_path} (cell '{cell_name}') ...")
    wrapper_pins = wrapper_pin_set(kdb, gds_path, cell_name)
    wrapper_an = an_prefix(wrapper_pins)
    if len(wrapper_an) != 1:
        print(f"[ERROR] {gds_path}: expected exactly one 's<N>_an' analog I/O prefix, "
              f"found {sorted(wrapper_an) or 'none'}.", file=sys.stderr)
        return 1
    new_an_prefix = next(iter(wrapper_an))  # e.g. "s7_an"
    wrapper_rest = {p for p in wrapper_pins if not SLOT_AN_RE.match(p)}

    existing = sorted(glob.glob(os.path.join(args.schem_dir, "slot_*.sch")))
    if len(existing) != 1:
        print(f"[ERROR] Expected exactly one {args.schem_dir}/slot_*.sch, found {len(existing)}: "
              f"{existing}", file=sys.stderr)
        return 1
    old_sch = existing[0]
    old_base = os.path.splitext(os.path.basename(old_sch))[0]  # "slot_1"
    if not re.match(r"^slot_\d+$", old_base):
        print(f"[ERROR] {old_sch}: filename doesn't match 'slot_<N>.sch'.", file=sys.stderr)
        return 1

    header, instances = parse_sch(open(old_sch, encoding="utf-8").read())
    instances = expand_and_relayout(instances)

    sch_an = an_prefix({inst["lab"] for inst in instances})
    if len(sch_an) != 1:
        print(f"[ERROR] {old_sch}: expected exactly one 's<N>_an' pin prefix, "
              f"found {sorted(sch_an) or 'none'}.", file=sys.stderr)
        return 1
    old_an_prefix = next(iter(sch_an))  # e.g. "s1_an"

    for inst in instances:
        if inst["lab"].startswith(old_an_prefix):
            inst["lab"] = inst["lab"].replace(old_an_prefix, new_an_prefix)

    sch_rest = {inst["lab"] for inst in instances if not SLOT_AN_RE.match(inst["lab"])}
    extra_in_sch = sch_rest - wrapper_rest
    if extra_in_sch:
        print(f"[INFO] {gds_path} doesn't have pin(s) {sorted(extra_in_sch)} - removing them "
              f"from {old_sch}.")
        instances = [inst for inst in instances if inst["lab"] not in extra_in_sch]

    missing_in_sch = sorted(wrapper_rest - sch_rest)
    for lab in missing_in_sch:
        base = strip_bus(lab)
        direction = infer_direction(base)
        if base in EXTERNAL_VSS_PINS:
            print(f"[INFO] {gds_path}: {EXTERNAL_VSS_PINS[base]} - adding '{lab}' as its own "
                  f"{direction} pin.")
        else:
            print(f"[INFO] {gds_path}: new pin '{lab}' not in {old_sch} yet - adding it as a "
                  f"{direction} pin.")
        instances.append({"kind": {"in": "ipin", "out": "opin", "inout": "iopin"}[direction],
                           "x": column_for(direction, base), "lab": lab})

    instances = expand_and_relayout(instances)  # final relayout after any additions

    new_base = f"slot_{args.slot}"
    new_sch = os.path.join(args.schem_dir, f"{new_base}.sch")
    if old_sch != new_sch and os.path.exists(new_sch):
        print(f"[ERROR] {new_sch} already exists, refusing to overwrite it.", file=sys.stderr)
        return 1

    with open(old_sch, "w", encoding="utf-8") as f:
        f.write(render_sch(header, instances))
    if old_sch != new_sch:
        os.rename(old_sch, new_sch)
        old_sym = os.path.join(args.schem_dir, f"{old_base}.sym")
        old_pex_sym = os.path.join(args.schem_dir, f"{old_base}_pex.sym")
        for stale in (old_sym, old_pex_sym):
            if os.path.isfile(stale):
                os.remove(stale)
                print(f"[INFO] Removed stale {stale} (regenerating from the new schematic).")
    print(f"[INFO] {old_sch} -> {new_sch}")

    generate_symbol(args.schem_dir, new_base)
    print(f"[INFO] slot_{args.slot} is now in sync with {gds_path}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
