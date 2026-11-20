# SPDX-FileCopyrightText: 2026 Tim Edwards and Simon Dorrer
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
# Description: Reorder a netlist's top-cell .subckt header to match another netlist's pin order,
# by name. Unlike a macro instance (see blackbox_digital_macros.py's reorder_to_symbol_order),
# the top cell has no caller, so only the header needs rewriting - Magic's extraction order
# doesn't match Xschem's, and netgen's top-level pin matching needs them aligned.

import argparse
import re
import sys

SUBCKT_RE = re.compile(r"^\.subckt\s+(\S+)", re.IGNORECASE)


def find_header(lines, name):
    """Return (start_index, header_end_index, pins) for '.subckt <name> ...', or None."""
    for i, line in enumerate(lines):
        m = SUBCKT_RE.match(line.strip())
        if m and m.group(1) == name:
            header_end = i
            while header_end + 1 < len(lines) and lines[header_end + 1].lstrip().startswith("+"):
                header_end += 1
            text = " ".join(l.lstrip("+").strip() for l in lines[i:header_end + 1])
            pins = text.split()[2:]  # drop ".subckt" and the name
            return i, header_end, pins
    return None


def main():
    parser = argparse.ArgumentParser(
        description="Reorder a netlist's top-cell .subckt header to match another's pin order."
    )
    parser.add_argument("netlist", help="netlist to reorder in place")
    parser.add_argument("reference", help="netlist whose pin order to match")
    parser.add_argument("cell", help="top cell name (same in both netlists)")
    args = parser.parse_args()

    ref_lines = open(args.reference, encoding="utf-8").read().splitlines()
    ref = find_header(ref_lines, args.cell)
    if ref is None:
        print(f"[ERROR] {args.reference}: no '.subckt {args.cell}' found.", file=sys.stderr)
        return 1
    _, _, ref_pins = ref

    lines = open(args.netlist, encoding="utf-8").read().splitlines()
    found = find_header(lines, args.cell)
    if found is None:
        print(f"[ERROR] {args.netlist}: no '.subckt {args.cell}' found.", file=sys.stderr)
        return 1
    start, header_end, pins = found

    if sorted(pins) != sorted(ref_pins):
        only_here = sorted(set(pins) - set(ref_pins))
        only_ref = sorted(set(ref_pins) - set(pins))
        print(f"[ERROR] {args.netlist} and {args.reference} don't have the same pin set for "
              f"'{args.cell}'. Only in {args.netlist}: {only_here}. Only in {args.reference}: "
              f"{only_ref}.", file=sys.stderr)
        return 1

    if pins == ref_pins:
        print(f"[INFO] {args.netlist}: '{args.cell}' is already in the same pin order as "
              f"{args.reference}, nothing to do.")
        return 0

    lines[start:header_end + 1] = [f".subckt {args.cell} " + " ".join(ref_pins)]
    with open(args.netlist, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"[INFO] {args.netlist}: reordered '{args.cell}' pins to match {args.reference}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
