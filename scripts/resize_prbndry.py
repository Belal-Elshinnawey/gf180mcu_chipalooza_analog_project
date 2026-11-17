#!/usr/bin/env python3
"""Grow or shrink the pr_bndry layer (0/0) of a GDS by a fixed margin.

gdsfill reads pr_bndry directly as its die boundary for both the fill and
density calculations, and keeps a fixed internal keep-out distance (26um
for gf180mcu) inward from that boundary. Temporarily growing pr_bndry by
exactly that same margin before running gdsfill, then shrinking it back by
the same amount afterward, makes gdsfill's keep-out land on the *real* die
edge instead of 26um inside it - without ever placing fill beyond the real
edge, since gdsfill's own keep-out still enforces that boundary.

Usage: resize_prbndry.py <gds> <delta_um>
  delta_um > 0  grows pr_bndry outward by delta_um on every side
  delta_um < 0  shrinks it back inward by the same amount
"""
import sys
import pya


def main():
    if len(sys.argv) != 3:
        print(f"usage: {sys.argv[0]} <gds> <delta_um>", file=sys.stderr)
        return 2

    path, delta_um = sys.argv[1], float(sys.argv[2])

    lv = pya.Layout()
    lv.read(path)
    dbu = lv.dbu
    top = lv.top_cell()

    li = lv.layer(0, 0)
    region = pya.Region(top.begin_shapes_rec(li))
    if region.is_empty():
        print("[ERROR] pr_bndry (layer 0/0) has no shapes", file=sys.stderr)
        return 1
    region.merge()
    bbox = region.bbox()

    delta_dbu = int(round(delta_um / dbu))
    new_box = pya.Box(bbox.left - delta_dbu, bbox.bottom - delta_dbu,
                       bbox.right + delta_dbu, bbox.top + delta_dbu)

    top.shapes(li).clear()
    top.shapes(li).insert(new_box)
    lv.write(path)

    print(f"[INFO] pr_bndry {bbox.left*dbu},{bbox.bottom*dbu} .. {bbox.right*dbu},{bbox.top*dbu} "
          f"-> {new_box.left*dbu},{new_box.bottom*dbu} .. {new_box.right*dbu},{new_box.top*dbu}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
