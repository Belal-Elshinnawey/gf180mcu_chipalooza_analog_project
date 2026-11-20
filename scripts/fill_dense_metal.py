#!/usr/bin/env python3
"""Replace gdsfill's dummy fill on one metal layer with a tighter tiling at gf180mcu's real
0.98um min dummy-to-dummy spacing (DM#{idx}.2b), since gdsfill's own wider hardcoded spacing
can't clear the 30% density floor. Keeps the real DM#{idx}.3 clearance from drawn metal and
avoids *_BLK markers.

Does NOT implement DM#{idx}.8 (FuseTop/POLYFUSE/FUSEWINDOW_D/PMNDMY/MTPMK/OTP_MK clearance) -
add it before reuse on a design that has those structures.
"""
import sys
import pya

EDGE_MARGIN_UM = 26.0
SQUARE_UM = 2.0
GAP_UM = 0.98
PITCH_UM = SQUARE_UM + GAP_UM
REAL_METAL_CLEARANCE_UM = 2.0  # DM#{idx}.3


def main():
    if len(sys.argv) != 3:
        print(f"usage: {sys.argv[0]} <gds> <layer_number>", file=sys.stderr)
        return 2

    path, layer_num = sys.argv[1], int(sys.argv[2])
    lv = pya.Layout()
    lv.read(path)
    dbu = lv.dbu
    top = lv.top_cell()

    pr_li = lv.layer(0, 0)
    die = pya.Region(top.shapes(pr_li))
    die.merge()
    die_bbox = die.bbox()

    margin_dbu = int(round(EDGE_MARGIN_UM / dbu))
    fillable = pya.Box(die_bbox.left + margin_dbu, die_bbox.bottom + margin_dbu,
                        die_bbox.right - margin_dbu, die_bbox.top - margin_dbu)

    real_li = lv.find_layer(layer_num, 0)
    real_metal = pya.Region()
    if real_li is not None:
        real_metal = pya.Region(top.shapes(real_li))
        real_metal.merge()
    clearance_dbu = int(round(REAL_METAL_CLEARANCE_UM / dbu))
    keepout = real_metal.sized(clearance_dbu) if not real_metal.is_empty() else real_metal

    blk_li = lv.find_layer(layer_num, 5)
    if blk_li is not None:
        blk = pya.Region(top.shapes(blk_li))
        blk.merge()
        keepout += blk

    square_dbu = int(round(SQUARE_UM / dbu))
    pitch_dbu = int(round(PITCH_UM / dbu))

    # Test each candidate tile against keepout individually and drop it
    # whole if it interacts at all - never insert a partially-clipped
    # tile, since that can leave a sliver smaller than MT.1/MT.4's
    # minimum width/area.
    tiles = pya.Region()
    y = fillable.bottom
    while y + square_dbu <= fillable.top:
        x = fillable.left
        while x + square_dbu <= fillable.right:
            box = pya.Box(x, y, x + square_dbu, y + square_dbu)
            if keepout.interacting(pya.Region(box)).is_empty():
                tiles.insert(box)
            x += pitch_dbu
        y += pitch_dbu

    tiles.merge()

    dummy_li = lv.layer(layer_num, 4)
    top.shapes(dummy_li).clear()
    top.shapes(dummy_li).insert(tiles)
    lv.write(path)

    area = tiles.area() * dbu * dbu
    die_area = die_bbox.area() * dbu * dbu
    print(f"[INFO] layer {layer_num}/4: {tiles.count()} shape(s), {area:.1f} um^2 "
          f"({100*area/die_area:.1f}% of full die area)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
