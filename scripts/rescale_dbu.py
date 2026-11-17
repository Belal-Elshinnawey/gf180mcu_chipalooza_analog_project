#!/usr/bin/env python3
"""Rewrite a GDS at a different database unit, preserving physical dimensions.

Uses SaveLayoutOptions.dbu so KLayout's writer re-quantizes coordinates at
write time (same mechanism as the GUI's Save As dbu field). Do NOT replace
this with Layout.dbu= (just relabels the unit, scales the physical size) or
a Cell.transform() loop (double-scales through nested instance hierarchy).
"""
import sys
import pya


def main():
    if len(sys.argv) != 4:
        print(f"usage: {sys.argv[0]} <src.gds> <dst.gds> <target_dbu>", file=sys.stderr)
        return 2

    src, dst, target_dbu = sys.argv[1], sys.argv[2], float(sys.argv[3])

    lv = pya.Layout()
    lv.read(src)
    old_dbu = lv.dbu
    old_bbox = lv.top_cell().bbox()

    if abs(old_dbu - target_dbu) < 1e-12:
        if src != dst:
            lv.write(dst)
        print(f"[INFO] Already at dbu={old_dbu}, wrote through unchanged.")
        return 0

    opts = pya.SaveLayoutOptions()
    opts.dbu = target_dbu
    lv.write(dst, opts)

    chk = pya.Layout()
    chk.read(dst)
    new_dbu = chk.dbu
    new_bbox = chk.top_cell().bbox()

    old_phys = (old_bbox.left * old_dbu, old_bbox.bottom * old_dbu,
                old_bbox.right * old_dbu, old_bbox.top * old_dbu)
    new_phys = (new_bbox.left * new_dbu, new_bbox.bottom * new_dbu,
                new_bbox.right * new_dbu, new_bbox.top * new_dbu)

    print(f"[INFO] Rescaled dbu {old_dbu} -> {new_dbu}")
    if not all(abs(a - b) < 1e-9 for a, b in zip(old_phys, new_phys)):
        print(f"[ERROR] Physical bbox changed: {old_phys} -> {new_phys}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
