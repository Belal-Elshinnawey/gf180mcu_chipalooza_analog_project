# SPDX-FileCopyrightText: 2026 Tim Edwards and Simon Dorrer
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
# Description: Black-box every digital macro in a SPICE netlist for top-level LVS. A macro is
# detected by its .sym carrying sim_pinname= attributes. On the layout side, a macro's real
# .subckt body is stripped to just the pin-list header; on the schematic side (type=primitive,
# no .subckt at all), one is synthesized from the instance call.
#
# Pin order matters even though the cells end up empty: netgen's "-blackbox" matching is purely
# positional, and Magic's extraction order doesn't match the .sym's declared order. So any real
# (non-stub) definition gets its header and instance line reordered to .sym pin order via
# sim_pinname first; the schematic side is already in symbol order by construction.
#
# Run netgen's "lvs -blackbox" afterwards - same-named empty subcircuits then match by pin count
# and position.

import argparse
import glob
import os
import re
import sys

SUBCKT_RE = re.compile(r"^\.subckt\s+(\S+)", re.IGNORECASE)
ENDS_RE = re.compile(r"^\.ends\b", re.IGNORECASE)
XLINE_RE = re.compile(r"^([xX]\S+)\s+(.*)$")
SYM_PIN_RE = re.compile(r"^B\s+5\s+.*\{name=(\S+)\s+dir=\w+[^}]*\}")
BUS_RANGE_RE = re.compile(r"^(.+)\[(\d+)\.\.(\d+)\]$")
SINGLE_INDEX_RE = re.compile(r"^(.+)\[(\d+)\]$")
SIM_PINNAME_RE = re.compile(r"sim_pinname=([^\s}]+)")


def find_all_macro_syms(root):
    """Return {cell_name: sym_path} for every .sym file anywhere under root."""
    found = {}
    for sym in glob.glob(os.path.join(root, "**", "*.sym"), recursive=True):
        found[os.path.splitext(os.path.basename(sym))[0]] = sym
    return found


def detect_digital_macros(root):
    """Return {cell_name: sym_path} for every .sym (anywhere under root) that declares sim_pinname=."""
    found = {}
    for sym in glob.glob(os.path.join(root, "**", "*.sym"), recursive=True):
        text = open(sym, encoding="utf-8", errors="replace").read()
        if "sim_pinname=" in text:
            found[os.path.splitext(os.path.basename(sym))[0]] = sym
    return found


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
            # e.g. make_symbol expanded a bus into individual 'do_b[3]' pins, each stamped
            # with the same bare sim_pinname=counter_value_o - apply the pin's own index.
            order.append(f"{real}[{sm.group(2)}]")
        else:
            order.append(real)
    return order


def join_continuations(lines):
    """Yield each logical line with SPICE '+' continuation lines joined in - for scanning only,
    the original physical lines are left untouched."""
    buf = None
    for line in lines:
        if line.lstrip().startswith("+") and buf is not None:
            buf += " " + line.lstrip()[1:].strip()
        else:
            if buf is not None:
                yield buf
            buf = line.rstrip()
    if buf is not None:
        yield buf


def find_subckt_span(lines, name):
    """Return (start_index, header_end_index, ends_index) for '.subckt <name> ...' ... '.ends',
    or None. header_end_index is the last line of the (possibly multi-line, '+'-continued)
    pin-list header."""
    for i, line in enumerate(lines):
        m = SUBCKT_RE.match(line.strip())
        if m and m.group(1) == name:
            header_end = i
            while header_end + 1 < len(lines) and lines[header_end + 1].lstrip().startswith("+"):
                header_end += 1
            for j in range(header_end + 1, len(lines)):
                if ENDS_RE.match(lines[j].strip()):
                    return i, header_end, j
            raise ValueError(f".subckt {name} has no matching .ends")
    return None


def find_call(lines, macro_name):
    """Find the instance call for macro_name, joining '+' continuations. Return
    (inst_name, args, start_index, end_index_exclusive) or None."""
    i = 0
    while i < len(lines):
        start = i
        buf = lines[i].rstrip()
        i += 1
        while i < len(lines) and lines[i].lstrip().startswith("+"):
            buf += " " + lines[i].lstrip()[1:].strip()
            i += 1
        m = XLINE_RE.match(buf.strip())
        if m:
            tokens = m.group(2).split()
            if tokens and tokens[-1] == macro_name:
                return m.group(1), tokens[:-1], start, i
    return None


def reorder_to_symbol_order(lines, macro_name, sym_path, netlist_path):
    """If this netlist has a REAL (non-stub) definition of macro_name, reorder its header and
    its calling instance line to the .sym's declared pin order. Returns the (possibly modified)
    lines. No-op if the macro has no real definition here (the schematic/stub side)."""
    span = find_subckt_span(lines, macro_name)
    if span is None:
        return lines
    start, header_end, ends_idx = span
    header_text = " ".join(l.lstrip("+").strip() for l in lines[start:header_end + 1])
    old_header_pins = header_text.split()[2:]  # drop ".subckt" and the name

    call = find_call(lines, macro_name)
    if call is None:
        print(f"[WARNING] {netlist_path}: found a real '.subckt {macro_name}' but no instance "
              f"calling it - leaving its pin order as-is.", file=sys.stderr)
        return lines
    inst_name, old_args, call_start, call_end = call
    if len(old_args) != len(old_header_pins):
        raise ValueError(f"{netlist_path}: '{macro_name}' instance has {len(old_args)} arg(s) "
                          f"but its .subckt declares {len(old_header_pins)} pin(s)")

    symbol_order = parse_symbol_order(sym_path)
    if sorted(symbol_order) != sorted(old_header_pins):
        raise ValueError(f"{netlist_path}: '{macro_name}' pin set from {sym_path} "
                          f"{sorted(symbol_order)} doesn't match the netlist's "
                          f"{sorted(old_header_pins)}")
    if symbol_order == old_header_pins:
        return lines  # already in symbol order, nothing to do

    pin_to_arg = dict(zip(old_header_pins, old_args))
    new_args = [pin_to_arg[pin] for pin in symbol_order]
    print(f"[INFO] {netlist_path}: reordered '{macro_name}' (header + its '{inst_name}' "
          f"instance) from Magic's extraction order to the .sym's declared pin order, so "
          f"black-box position matching lines up with the schematic side.")

    new_header = f".subckt {macro_name} " + " ".join(symbol_order)
    new_call = f"{inst_name} " + " ".join(new_args + [macro_name])

    # Apply the call edit first if it comes after the header (indices into the same list),
    # so removing/replacing the header lines first wouldn't shift the call's indices.
    if call_start > header_end:
        lines[call_start:call_end] = [new_call]
        lines[start:header_end + 1] = [new_header]
    else:
        lines[start:header_end + 1] = [new_header]
        lines[call_start:call_end] = [new_call]
    return lines


def blackbox(netlist_path, macros, all_macros):
    lines = open(netlist_path, encoding="utf-8").read().splitlines()
    handled = set()

    # Normalize every instantiated macro (not just the ones to black-box) to its .sym pin order -
    # Magic's extraction order vs Xschem's symbol order mismatch alone can break netgen's matching.
    for name, sym_path in sorted(all_macros.items()):
        lines = reorder_to_symbol_order(lines, name, sym_path, netlist_path)

    for name, sym_path in sorted(macros.items()):
        span = find_subckt_span(lines, name)
        if span is None:
            continue
        start, header_end, end = span
        dropped = end - header_end - 1
        if dropped > 0:
            print(f"[INFO] {netlist_path}: black-boxing '{name}' - stripped {dropped} line(s) "
                  f"of its real implementation, kept the full (possibly multi-line) pin-list "
                  f"header and .ends.")
            del lines[header_end + 1:end]
        else:
            print(f"[INFO] {netlist_path}: '{name}' is already an empty subcircuit, nothing to strip.")
        handled.add(name)

    remaining = set(macros) - handled
    stubs = []
    for joined in join_continuations(lines):
        m = XLINE_RE.match(joined.strip())
        if not m:
            continue
        tokens = m.group(2).split()
        if not tokens:
            continue
        devname = tokens[-1]
        if devname in remaining:
            pins = tokens[:-1]
            stubs.append(f".subckt {devname} {' '.join(pins)}")
            stubs.append(".ends")
            print(f"[INFO] {netlist_path}: no '.subckt {devname}' definition found - synthesized "
                  f"an empty black-box stub with {len(pins)} pin(s), matching its instance call.")
            remaining.discard(devname)

    if remaining:
        print(f"[WARNING] {netlist_path}: macro(s) {sorted(remaining)} are never instantiated here, "
              f"nothing to black-box.")

    if stubs:
        # Prepended, not appended: a stub placed after the instance that calls it would make
        # netgen hit the undefined reference first and auto-create its own generic placeholder
        # device class, then merge it with the real stub instead of replacing it.
        lines = stubs + lines

    with open(netlist_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")


def main():
    parser = argparse.ArgumentParser(
        description="Black-box every detected digital macro in a SPICE netlist for top-level LVS."
    )
    parser.add_argument("netlist", help="SPICE netlist to modify in place")
    parser.add_argument("--root", required=True, help="project root to search for .sym files under")
    parser.add_argument("--macro", action="append", default=[],
                        help="also black-box this macro name (repeatable), in addition to "
                             "auto-detected ones - looked up as <root>/**/<macro>.sym")
    args = parser.parse_args()

    all_macros = find_all_macro_syms(args.root)
    macros = detect_digital_macros(args.root)
    for name in args.macro:
        matches = glob.glob(os.path.join(args.root, "**", f"{name}.sym"), recursive=True)
        if not matches:
            print(f"[ERROR] --macro {name}: no {name}.sym found under {args.root}", file=sys.stderr)
            return 1
        macros[name] = matches[0]
        all_macros[name] = matches[0]

    if macros:
        print(f"[INFO] Detected digital macro(s) to black-box: {sorted(macros)}")
    else:
        print(f"[INFO] No digital macros (sim_pinname=) found under {args.root}; "
              f"still normalizing pin order for any other instantiated macro.")
    blackbox(args.netlist, macros, all_macros)
    return 0


if __name__ == "__main__":
    sys.exit(main())
