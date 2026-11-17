#!/usr/bin/env python3
"""Temporarily make gdsfill respect gf180mcu's metal *_BLK fill-exclusion
layers, which it has no built-in concept of (its keepout set only covers
real drawn COMP/Poly2/Metal1-5, not the _BLK marker layers - confirmed from
gdsfill's own needed_layers() source).

For each _BLK layer, stamps the part that doesn't already overlap real
drawn metal onto the real drawn layer (datatype 0, which gdsfill *does*
treat as keepout) and, separately, onto a scratch tracking datatype so
undo_blk_workaround.py can remove exactly that stamped portion afterward
without touching genuinely real metal - even where a _BLK marker happens
to overlap real content.
"""
import sys
import pya

# (metal_number, blk_datatype) -> real drawn datatype is always 0
BLK_LAYERS = [34, 36, 42, 46, 81, 53]  # Metal1-5, MetalTop
BLK_DATATYPE = 5
TRACK_DATATYPE = 90


def main():
    if len(sys.argv) != 2:
        print(f"usage: {sys.argv[0]} <gds>", file=sys.stderr)
        return 2

    path = sys.argv[1]
    lv = pya.Layout()
    lv.read(path)
    top = lv.top_cell()

    total = 0
    for num in BLK_LAYERS:
        blk_li = lv.find_layer(num, BLK_DATATYPE)
        if blk_li is None:
            continue
        blk_region = pya.Region(top.begin_shapes_rec(blk_li))
        if blk_region.is_empty():
            continue
        blk_region.merge()

        drawn_li = lv.layer(num, 0)
        drawn_region = pya.Region(top.begin_shapes_rec(drawn_li))
        drawn_region.merge()

        extra = blk_region - drawn_region
        if extra.is_empty():
            continue

        track_li = lv.layer(num, TRACK_DATATYPE)
        top.shapes(drawn_li).insert(extra)
        top.shapes(track_li).insert(extra)
        n = extra.count()
        total += n
        print(f"layer {num}/0: stamped {n} shape(s) from {num}/{BLK_DATATYPE} (tracked on {num}/{TRACK_DATATYPE})")

    print("total stamped:", total)
    lv.write(path)
    return 0


if __name__ == "__main__":
    sys.exit(main())
