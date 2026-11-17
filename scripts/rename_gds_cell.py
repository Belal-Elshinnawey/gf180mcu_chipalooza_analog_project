# SPDX-FileCopyrightText: 2026 Tim Edwards and Simon Dorrer
# SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
# Description: Copy a GDS file and rename one cell in it (used to turn a floorplan wrapper's
# slotN_wrapper top cell into slot_N for the top-level layout).

import argparse
import sys


def main():
    parser = argparse.ArgumentParser(description="Copy a GDS file and rename a cell in it.")
    parser.add_argument("src", help="source GDS file")
    parser.add_argument("dst", help="destination GDS file")
    parser.add_argument("old_name", help="name of the cell to rename")
    parser.add_argument("new_name", help="new name for that cell")
    args = parser.parse_args()

    try:
        import klayout.db as kdb
    except ImportError:
        print("[ERROR] The klayout Python module is not available. Run this inside the "
              "IIC-OSIC-TOOLS container.", file=sys.stderr)
        return 2

    layout = kdb.Layout()
    layout.read(args.src)
    cell = layout.cell(args.old_name)
    if cell is None:
        print(f"[ERROR] {args.src}: no cell '{args.old_name}' found.", file=sys.stderr)
        return 1
    if args.old_name != args.new_name and layout.cell(args.new_name) is not None:
        print(f"[ERROR] {args.src}: a cell named '{args.new_name}' already exists.", file=sys.stderr)
        return 1

    cell.name = args.new_name
    layout.write(args.dst)
    print(f"[INFO] {args.src} -> {args.dst}: renamed cell '{args.old_name}' to '{args.new_name}'.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
