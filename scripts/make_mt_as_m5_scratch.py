#!/usr/bin/env python3
"""Build an isolated scratch GDS where MetalTop content is relabeled as
Metal5, so gdsfill's own tested Metal5 fill algorithm/parameters can be
used to generate MetalTop dummy fill (gdsfill has no native MetalTop
support for gf180mcuD at all).

Copies (recursively, so nested instance content is included):
  - pr_bndry (0/0)            -> unchanged, gdsfill's die boundary
  - MetalTop drawn (53/0)     -> Metal5 drawn (81/0)
  - MetalTop _BLK (53/5)      -> Metal5 _BLK (81/5)
into a fresh layout containing nothing else, at the same dbu as the
source. Run the normal rescale/pr_bndry-expand/blk-workaround/gdsfill
chain on the result, then pull the resulting Metal5 dummy (81/4) back out
and relabel it onto MetalTop dummy (53/4) with extract_mt_from_m5.py.
"""
import sys
import pya


def main():
    if len(sys.argv) != 3:
        print(f"usage: {sys.argv[0]} <original.gds> <scratch.gds>", file=sys.stderr)
        return 2

    src_path, dst_path = sys.argv[1], sys.argv[2]

    src = pya.Layout()
    src.read(src_path)
    src_top = src.top_cell()

    dst = pya.Layout()
    dst.dbu = src.dbu
    dst_top = dst.create_cell(src_top.name)

    def copy_layer(src_num, src_dt, dst_num, dst_dt):
        src_li = src.find_layer(src_num, src_dt)
        if src_li is None:
            return 0
        region = pya.Region(src_top.begin_shapes_rec(src_li))
        region.merge()
        if region.is_empty():
            return 0
        dst_li = dst.layer(dst_num, dst_dt)
        dst_top.shapes(dst_li).insert(region)
        return region.count()

    n_bndry = copy_layer(0, 0, 0, 0)
    n_drawn = copy_layer(53, 0, 81, 0)
    n_blk = copy_layer(53, 5, 81, 5)

    dst.write(dst_path)
    print(f"[INFO] pr_bndry: {n_bndry} shape(s), MetalTop drawn->Metal5: {n_drawn} shape(s), "
          f"MetalTop_BLK->Metal5_BLK: {n_blk} shape(s)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
