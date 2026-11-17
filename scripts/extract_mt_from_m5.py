#!/usr/bin/env python3
"""Pull the Metal5 dummy fill (81/4) out of the MT-as-M5 scratch GDS,
relabel it onto MetalTop dummy (53/4), and insert it into the real
original GDS's top cell.

Both files must already be at the same dbu - rescale the scratch copy
back to the original's dbu (via rescale_dbu.py) before calling this.
Any existing MetalTop dummy shapes in the original are cleared first.
"""
import sys
import pya


def main():
    if len(sys.argv) != 3:
        print(f"usage: {sys.argv[0]} <scratch_filled.gds> <original.gds>", file=sys.stderr)
        return 2

    scratch_path, original_path = sys.argv[1], sys.argv[2]

    scratch = pya.Layout()
    scratch.read(scratch_path)
    scratch_top = scratch.top_cell()
    scratch_dbu = scratch.dbu

    original = pya.Layout()
    original.read(original_path)
    original_top = original.top_cell()
    original_dbu = original.dbu

    if abs(scratch_dbu - original_dbu) > 1e-12:
        print(f"[ERROR] dbu mismatch: scratch={scratch_dbu}, original={original_dbu} - "
              "rescale the scratch copy to the original's dbu first", file=sys.stderr)
        return 1

    m5_dummy_li = scratch.find_layer(81, 4)
    fill_region = pya.Region()
    if m5_dummy_li is not None:
        fill_region = pya.Region(scratch_top.shapes(m5_dummy_li))
        fill_region.merge()

    mt_dummy_li = original.layer(53, 4)
    original_top.shapes(mt_dummy_li).clear()
    original_top.shapes(mt_dummy_li).insert(fill_region)

    area = fill_region.area() * original_dbu * original_dbu
    print(f"[INFO] metaltop_dummy (53/4): {fill_region.count()} shape(s) from Metal5 dummy, {area:.1f} um^2")

    original.write(original_path)
    return 0


if __name__ == "__main__":
    sys.exit(main())
