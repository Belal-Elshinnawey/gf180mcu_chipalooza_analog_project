#!/usr/bin/env python3
"""Flatten a GDS's top cell fully (all instances resolved into literal
shapes), writing the result as a new, hierarchy-free top cell.

Used to make a disposable scratch copy for gdsfill, since gdsfill only
reads shapes directly in the top cell - it has no concept of a placed
instance's own content, so without flattening it fills right through any
macro's footprint.
"""
import sys
import pya


def main():
    if len(sys.argv) != 3:
        print(f"usage: {sys.argv[0]} <src.gds> <dst.gds>", file=sys.stderr)
        return 2

    src, dst = sys.argv[1], sys.argv[2]
    lv = pya.Layout()
    lv.read(src)
    top = lv.top_cell()
    top.flatten(-1, True)
    lv.write(dst)
    print(f"[INFO] flattened {src} -> {dst}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
