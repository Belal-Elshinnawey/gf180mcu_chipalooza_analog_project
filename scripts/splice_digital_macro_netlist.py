# SPDX-FileCopyrightText: 2026 Tim Edwards and Simon Dorrer
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
# Description: Splice a digital macro's real, pre-extracted gate-level netlist into a top-level
# LVS schematic netlist, in place of black-boxing it. A hardened macro's symbol is type=primitive
# (no .subckt body at all from Xschem), so without this, netgen has only an empty/undefined
# reference to compare against the layout's real gates - which makes its automorphism resolver
# unable to disambiguate symmetric-looking nets (e.g. two power rails) once the macro has zero
# internal structure. Giving it real content instead - the same gate-level netlist produced by
# the macro's own build flow - lets netgen flatten-and-match it like any other real subcircuit
# (the same way it already handles a plain analog macro such as the inverter).
#
# The reference netlist's own .subckt header is reordered to the macro's .sym pin order first
# (Magic/LibreLane's own extraction order has no relation to it, same issue as in
# blackbox_digital_macros.py's reorder_to_symbol_order) - the body's internal wiring is untouched,
# since it refers to nodes by name, not position; only the header's formal parameter order needs
# to agree with how Xschem's instance call (written in the .sym's order) binds to it.

import argparse
import glob
import os
import re
import sys

SUBCKT_RE = re.compile(r"^\.subckt\s+(\S+)", re.IGNORECASE)
ENDS_RE = re.compile(r"^\.ends\b", re.IGNORECASE)
END_RE = re.compile(r"^\.end\b", re.IGNORECASE)
SYM_PIN_RE = re.compile(r"^B\s+5\s+.*\{name=(\S+)\s+dir=\w+[^}]*\}")
BUS_RANGE_RE = re.compile(r"^(.+)\[(\d+)\.\.(\d+)\]$")
SINGLE_INDEX_RE = re.compile(r"^(.+)\[(\d+)\]$")
SIM_PINNAME_RE = re.compile(r"sim_pinname=([^\s}]+)")


def parse_symbol_order(sym_path):
    """Return the .sym's declared pin order translated to sim_pinname (netlist-side) names,
    with bus pins ('name[A..B]') expanded bit-by-bit in declared order."""
    order = []
    for line in open(sym_path, encoding="utf-8", errors="replace"):
        m = SYM_PIN_RE.match(line.strip())
        if not m:
            continue
        name = m.group(1)
        pn = SIM_PINNAME_RE.search(line)
        real = pn.group(1) if pn else name
        bm = BUS_RANGE_RE.match(name)
        if bm:
            rbm = BUS_RANGE_RE.match(real)
            rbase = rbm.group(1) if rbm else real
            a, b = int(bm.group(2)), int(bm.group(3))
            step = 1 if a <= b else -1
            order.extend(f"{rbase}[{i}]" for i in range(a, b + step, step))
            continue
        sm = SINGLE_INDEX_RE.match(name)
        if sm and not SINGLE_INDEX_RE.match(real):
            order.append(f"{real}[{sm.group(2)}]")
        else:
            order.append(real)
    return order


def reorder_header(text, macro_name, sym_path):
    """Return text with macro_name's own .subckt header reordered to its .sym's pin order."""
    lines = text.splitlines()
    for i, line in enumerate(lines):
        m = SUBCKT_RE.match(line.strip())
        if not (m and m.group(1) == macro_name):
            continue
        header_end = i
        while header_end + 1 < len(lines) and lines[header_end + 1].lstrip().startswith("+"):
            header_end += 1
        header_text = " ".join(l.lstrip("+").strip() for l in lines[i:header_end + 1])
        old_pins = header_text.split()[2:]  # drop ".subckt" and the name

        symbol_order = parse_symbol_order(sym_path)
        if sorted(symbol_order) != sorted(old_pins):
            raise ValueError(f"'{macro_name}' pin set from {sym_path} {sorted(symbol_order)} "
                              f"doesn't match {old_pins} from its own reference netlist")
        if symbol_order != old_pins:
            lines[i:header_end + 1] = [f".subckt {macro_name} " + " ".join(symbol_order)]
        return "\n".join(lines) + "\n"
    raise ValueError(f"No '.subckt {macro_name}' found to reorder")


def splice(target_path, macro_name, reference_path, sym_path):
    reference = open(reference_path, encoding="utf-8").read()
    reference = reorder_header(reference, macro_name, sym_path)

    lines = open(target_path, encoding="utf-8").read().splitlines()
    lines = [l for l in lines if not END_RE.match(l.strip())]
    lines.append(reference.rstrip("\n"))
    lines.append(".end")
    with open(target_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"[INFO] {target_path}: spliced in the real netlist for '{macro_name}' from "
          f"{reference_path} (header reordered to match {sym_path}), replacing its "
          f"black-box/undefined reference.")


def detect_digital_macros(root):
    """Return {macro_name: sym_path} for every .sym under root that declares sim_pinname=
    (the mark of a hardened digital macro, see blackbox_digital_macros.py)."""
    found = {}
    for sym in glob.glob(os.path.join(root, "**", "*.sym"), recursive=True):
        text = open(sym, encoding="utf-8", errors="replace").read()
        if "sim_pinname=" in text:
            found[os.path.splitext(os.path.basename(sym))[0]] = sym
    return found


def main():
    parser = argparse.ArgumentParser(
        description="Splice every digital macro's real gate-level netlist into a top-level LVS "
                    "schematic netlist, instead of black-boxing it."
    )
    parser.add_argument("netlist", help="top-level LVS schematic netlist to modify in place")
    parser.add_argument("macro", nargs="?",
                        help="splice only this macro name, e.g. counter_top (default: every "
                             "detected digital macro that has a netlist/spice/<macro>.spice)")
    parser.add_argument("--root", required=True, help="project root to search under")
    args = parser.parse_args()

    macros = {args.macro: None} if args.macro else detect_digital_macros(args.root)
    target_text = open(args.netlist, encoding="utf-8").read()
    spliced = 0

    for macro in sorted(macros):
        if not re.search(rf"\b{re.escape(macro)}\b", target_text):
            continue  # not instantiated here, nothing to splice

        sym_matches = glob.glob(os.path.join(args.root, "**", f"{macro}.sym"), recursive=True)
        if not sym_matches:
            print(f"[ERROR] No {macro}.sym found under {args.root}", file=sys.stderr)
            return 1
        ref_matches = glob.glob(os.path.join(args.root, "**", "netlist", "spice",
                                              f"{macro}.spice"), recursive=True)
        if not ref_matches:
            print(f"[WARNING] {args.netlist}: '{macro}' is referenced and digital, but no "
                  f"netlist/spice/{macro}.spice was found under {args.root} to splice in - "
                  f"leaving it as-is (black-box it separately if needed).")
            continue

        splice(args.netlist, macro, ref_matches[0], sym_matches[0])
        target_text = open(args.netlist, encoding="utf-8").read()  # re-read before the next splice
        spliced += 1

    if spliced == 0:
        print(f"[INFO] {args.netlist}: nothing spliced.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
