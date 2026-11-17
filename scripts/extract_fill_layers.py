#!/usr/bin/env python3
"""Copy only the dummy-fill layers from a (flattened, gdsfill-processed)
scratch GDS into the real, hierarchy-intact original GDS's top cell.

Both files must already be at the same dbu - rescale the scratch copy
back to the original's dbu (via rescale_dbu.py) before calling this.

Any existing shapes on these layers in the original are cleared first, so
this is safe to re-run.

By default copies every dummy-fill layer gdsfill produces. Pass one or
more "layer:datatype" pairs to copy only those instead, e.g. "22:4" for
comp_dummy alone.
"""
import sys
import pya

DEFAULT_FILL_LAYERS = [
    (22, 4),  # comp_dummy
    (30, 4),  # poly2_dummy
    (34, 4),  # metal1_dummy
    (36, 4),  # metal2_dummy
    (42, 4),  # metal3_dummy
    (46, 4),  # metal4_dummy
    (81, 4),  # metal5_dummy
    # (53, 4) metaltop_dummy is handled separately by extract_mt_from_m5.py
]


def main():
    if len(sys.argv) < 3:
        print(f"usage: {sys.argv[0]} <scratch_filled.gds> <original.gds> [layer:datatype ...]", file=sys.stderr)
        return 2

    scratch_path, original_path = sys.argv[1], sys.argv[2]
    if len(sys.argv) > 3:
        fill_layers = []
        for arg in sys.argv[3:]:
            num_s, dt_s = arg.split(":")
            fill_layers.append((int(num_s), int(dt_s)))
    else:
        fill_layers = DEFAULT_FILL_LAYERS

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

    total = 0
    for num, dt in fill_layers:
        scratch_li = scratch.find_layer(num, dt)
        if scratch_li is None:
            continue
        fill_region = pya.Region(scratch_top.shapes(scratch_li))
        if fill_region.is_empty():
            continue
        fill_region.merge()

        orig_li = original.layer(num, dt)
        original_top.shapes(orig_li).clear()
        original_top.shapes(orig_li).insert(fill_region)
        n = fill_region.count()
        total += n
        print(f"layer {num}/{dt}: inserted {n} shape(s) into original")

    print("total inserted:", total)
    original.write(original_path)
    return 0


if __name__ == "__main__":
    sys.exit(main())
