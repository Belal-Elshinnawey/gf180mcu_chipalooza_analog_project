# Chipalooza Analog Project (gf180mcu)

(c) 2026 Tim Edwards and Simon Dorrer

> [!IMPORTANT]
> This repository requires the [IIC-OSIC-TOOLS](https://github.com/iic-jku/IIC-OSIC-TOOLS) container with tag `2026.08` or later.

> [!WARNING]
> This is a port of the [`sg13cmos5l_chipalooza_analog_project`](https://github.com/simi1505/sg13cmos5l_chipalooza_analog_project) template from the IHP `ihp-sg13cmos5l` Open-PDK to GlobalFoundries' `gf180mcuD` Open-PDK. Only the **harness** was ported — Makefiles, [`.designinit`](.designinit), the Xschem `xschemrc` chaining, the directory layout and the two helper scripts in [`scripts/`](scripts/) — and every PDK tool invocation in it now points at `gf180mcuD`. The **design content is not ported**:
> - The top-level hand-drawn schematic/layout (which instantiated the IHP inverter cells on the IHP floorplan) was removed rather than carried over broken. `schematic/xschem/`, `testbenches/xschem/` and `layout/` only keep their `xschemrc` files; `final/`, `netlist/` and `verification/` are gone until rebuilt.
> - [`macros/inverter/`](macros/inverter/README.md) is an empty shell (Makefile + README only) — this is the macro Chipalooza will replace next, to test this template end-to-end on gf180mcuD.
> - [`macros/counter/`](macros/counter/README.md) keeps its RTL, FPGA build and RTL/gate-level testbenches (PDK-independent), but its LibreLane hardening flow still targets IHP sg13cmos5l standard cells and corners — see its README for what's deferred.
> - [`floorplan/`](floorplan/) still ships the **IHP** floorplan GDS templates as geometry placeholders — they define the chip-harness slot/pin convention this template follows, but their actual pin/metal geometry is IHP's, not gf180mcuD's. Replace them with the real gf180mcu Chipalooza harness floorplan templates once available, and confirm layer/pitch before trusting them for anything beyond "where do the standard pins go."

> [!TIP]
> If you want to use `nix-shell` instead of the container, have a look here: [heichips26-template](https://github.com/HeiChips/heichips26-template) (IHP-specific; no gf180mcu equivalent is referenced by this port).

> [!TIP]
> New to this flow? Start with the [**ihp-sg13cmos5l AMS chip design tutorial**](https://iic-jku.github.io/ihp-sg13cmos5l-ams-chip-template/index.html). It is written for the IHP PDK, but this project follows the same analog flow and directory conventions, so the tutorial's structure and Makefile walkthrough still apply here — just mentally substitute `gf180mcuD` for `ihp-sg13cmos5l` throughout.

This is the analog-on-top example project for Chipalooza 2026: the top level `gf180mcu_chipalooza_analog_project` is meant to be drawn **by hand** in KLayout, based on one of the floorplan templates in `floorplan/`. It uses a **recursive macro structure**: the top level embeds the [`inverter`](macros/inverter/README.md) sub-macro, which (once built) will show the complete analog design flow (schematic → simulation → layout → DRC/LVS/PEX → post-layout simulation → characterization). For **mixed-signal (AMS)** submissions the digital [`counter`](macros/counter/README.md) sub-macro is shipped alongside it, which shows the complete digital flow (RTL → lint → RTL simulation → FPGA → LibreLane hardening → PEX → gate-level and mixed-signal simulation) — modulo the LibreLane re-port noted above.

The whole flow runs inside the [IIC-OSIC-TOOLS](https://github.com/iic-jku/IIC-OSIC-TOOLS) container, which ships every tool it needs: Xschem, ngspice, Magic, Netgen, KLayout, CACE, LibreLane, Verilator, Icarus Verilog, cocotb, Yosys, and the `sak-*` helper scripts — including `sak-pdk`, used to switch the container's active PDK (see [Selecting the PDK](#selecting-the-pdk) below).

> [!IMPORTANT]
> You must fill in [`submission.yaml`](submission.yaml) in the repository root before you submit. `top-cell` there has to match `TOP` in the [`Makefile`](Makefile).

[`submission.yaml`](submission.yaml) describes the submission and is what the precheck reads. It carries these fields:

| Field | Meaning |
| --- | --- |
| `project-name` | free-text name of the project |
| `top-cell` | the macro's cell name, unique across all submissions |
| `team-members` | one list entry per person |
| `slot-size` | `tiny` (200 µm × 200 µm), `small` (500 µm × 200 µm) or `large` (500 µm × 415 µm) |
| `analog-pins` | how many of `analog_0` … `analog_2` the macro uses, `0`–`3` |
| `short-description` | one line |
| `long-description` | the project documentation, Markdown in a YAML block scalar |
| `gds-path`, `lef-path`, `header-path` | globs for the three deliverables, each must match **exactly one** file |

Because the submission macro is the **top level** of this repository rather than a folder under `macros/`, the three paths are relative to the repository root:

```yaml
gds-path: final/gds/*.gds
lef-path: final/lef/*.lef
header-path: final/vh/*.vh
```

They are produced by `make build-top`, so run it once before submitting — this needs the top-level layout to exist first (see the Warning above).

> [!WARNING]
> The precheck this template descends from rejects `analog-pins` greater than `0` unless `slot-size` is `small`, even though a `tiny` analog floorplan template is shipped and `submission.yaml` defaults to it (`tiny` with three analog pins). Confirm the rule with the organizers before you rely on a tiny analog slot.


## Selecting the PDK

This container ships several PDKs. [`.designinit`](.designinit) hardcodes this project to `gf180mcuD`, and IIC-OSIC-TOOLS sources `$DESIGNS/.designinit` automatically when this repository is the mounted design directory. To switch a shell to a different PDK by hand (e.g. to compare against the original IHP template), use the `sak-pdk` helper:

```sh
sak-pdk <pdk> [<stdcell-lib>]      # e.g. sak-pdk gf180mcuD gf180mcu_fd_sc_mcu7t5v0
sak-pdk                            # lists installed PDKs
```

`sak-pdk` sets `PDK`, `PDKPATH`, `STD_CELL_LIBRARY`, `SPICE_USERINIT_DIR`, `KLAYOUT_PATH` and (for gf180mcu) `GF_PDK_OPTION`, mirroring what [`.designinit`](.designinit) exports for this repository. Re-source `.designinit` (`source .designinit`) to get back to `gf180mcuD` in the same shell.


## Directory Structure

<details>
<summary>Show Directory Structure</summary>

```text
📁 gf180mcu_chipalooza_analog_project/
├─ 📁 final/                                 # produced by `make build-top`, not yet built
│  ├─ 📁 gds/
│  ├─ 📁 lef/
│  ├─ 📁 lib/
│  └─ 📁 vh/
├─ 📁 floorplan/                             # empty until `make pull-wrappers`, see Floorplan Templates below
│  └─ slot1_wrapper.gds .. slot18_wrapper.gds  # pulled from gf180mcu_ocd_chipalooza, git-ignored
├─ 📁 layout/                                # empty until the top-level layout is drawn
├─ 📁 macros/
│  ├─ 📁 counter/                            # digital example sub-macro for AMS designs (own Makefile & README)
│  └─ 📁 inverter/                           # analog sub-macro placeholder, to be replaced (own Makefile & README)
├─ 📁 netlist/                                # produced by the verify/LVS/PEX targets, not yet built
├─ 📁 render/
│  └─ 📁 img/                                # produced by `make render-gds`, not yet built
├─ 📁 schematic/
│  └─ 📁 xschem/
│     └─ xschemrc
├─ 📁 scripts/
│  ├─ check_boundary.py
│  └─ check_pex_ports.py
├─ 📁 testbenches/
│  └─ 📁 xschem/
│     ├─ 📁 plot_simulations/
│     │  └─ ngspice2python.py
│     └─ xschemrc
├─ 📁 verification/                           # produced by the DRC/LVS/PEX targets, not yet built
├─ Makefile
├─ README.md
└─ submission.yaml                             # submission description read by the precheck
```

</details>


## Recursive Macro Structure

This project embeds two sub-macros in `macros/`, and each level has its own Makefile with the same targets:

- **Top level (`gf180mcu_chipalooza_analog_project`)** — the hand-drawn submission macro, not yet drawn in this port. Once built, its layout instantiates the `inverter` cells; its Makefile verifies and builds the **top cell only** (`CELL` defaults to `gf180mcu_chipalooza_analog_project`).
- **Analog sub-macro ([`macros/inverter/`](macros/inverter/README.md))** — placeholder for the complete flow reference unit cell (`TOP = inverter`) that will be designed for gf180mcuD.
- **Digital sub-macro ([`macros/counter/`](macros/counter/README.md))** — the digital counterpart for **mixed-signal (AMS)** designs (`TOP = counter_top`). Its RTL, FPGA build and RTL/gate-level cocotb testbenches are carried over unchanged from the IHP port (PDK-independent); its LibreLane hardening flow is **not** re-ported to gf180mcuD yet — see its README.

Every macro follows the same principle, and the simulations always run last, so they use the artifacts the same invocation has just produced:

| Makefile | `all` flow |
| --- | --- |
| [`macros/counter/`](macros/counter/) (digital) | lint → build (FPGA and LibreLane, including the XSPICE model) → extract (PEX of the hardened GDS) → simulate. DRC and LVS run inside the LibreLane flow. |
| [`macros/inverter/`](macros/inverter/) (analog) | verify (DRC, LVS, PEX) → build (LEF, LIB, Verilog stub, GDS, render) → simulate |
| top level | build macros → verify (DRC, LVS, PEX) → build (boundary check, LEF, LIB, Verilog stub, GDS, render) → simulate |

**Build order matters**: if you modify a sub-macro, run its own flow first (`make -C macros/inverter all` or `make -C macros/counter all`, or equivalently `make build-inverter` / `make build-counter` from here), then rebuild the top level. The top-level `make all` does this automatically by running `build-macros` before verifying and building the top cell.


## Floorplan Templates

`floorplan/` is empty until you run:

```sh
make pull-wrappers
```

This pulls `slot1_wrapper.gds` .. `slot18_wrapper.gds` straight from the real gf180mcu chip harness, [`RTimothyEdwards/gf180mcu_ocd_chipalooza`](https://github.com/RTimothyEdwards/gf180mcu_ocd_chipalooza)'s `gds/` directory, via a `git` partial/sparse clone (no `curl`/`wget` needed) — so you always get the current wrapper GDS, not a baked-in copy that can go stale. The pulled files are git-ignored; re-run `make pull-wrappers` any time to refresh them, no need to commit or push anything for that.

Start your top-level layout from the slot wrapper matching your assigned submission slot. They define the slot geometry and all pin positions:

- **Signal pins** (west edge): the standard chip interface (`clk`, `ena`, `rst_n`, `ui_in[7:0]`, `uo_out[7:0]`, `uio_*[7:0]`) that connects your project to the eFPGA.
- **Analog pins** (`analog_0` … `analog_2`, south edge) — only in the `*_analog` variants. Declare how many you use in [`submission.yaml`](submission.yaml) (`analog-pins:`), and see the warning above about which slot sizes may carry them.
- **Power straps**, running **vertically all the way from bottom to top**: `VPWR`, `VGND`, and optionally `VAPWR` (analog supply). Keeping them as drawn is the safe default when the layer mapping is confirmed to carry over.
- **PR boundary** on layer 0 (`pr_bndry`), the box the chip flow derives the macro bounding box from, see [PR Boundary Check](#pr-boundary-check). This is a chip-flow/Magic convention Magic maps to its internal boundary layer, **not** the same GDS layer number across PDKs: it was layer 189 in the IHP sg13cmos5l template this port descends from, but gf180mcuD uses layer 0 (`generic_layers.rb`'s `pr_bndry`) instead.


## Layout Sources and the Exported Tapeout GDS

Not yet applicable in this port — there is no `layout/gf180mcu_chipalooza_analog_project.klay.gds` or `.gds` yet. Once the top-level layout is drawn (per the [original template's convention](https://github.com/simi1505/sg13cmos5l_chipalooza_analog_project#layout-sources-and-the-exported-tapeout-gds)):

- `layout/gf180mcu_chipalooza_analog_project.klay.gds` is the KLayout editing source (live PCells + library references), and binds the library name `inverter` to `../macros/inverter/layout/inverter.gds` via a `.klib` file.
- `layout/gf180mcu_chipalooza_analog_project.gds` is exported from it with `File > Export Layout For Tapeout`, and is what every build and sign-off target reads.
- Re-export after every layout change, re-run DRC/LVS/PEX after every export, and never hand-edit the exported `.gds`.

The Makefile's `_GDS_EXT` variable picks `.gds` when it exists and falls back to `.klay.gds` otherwise, so the DRC, LVS and PEX targets work either way once either file exists.

To edit a layout, start KLayout in edit mode from inside the container, or use `make open` (needs the VNC/X11 desktop).


## Xschem Configuration

Xschem reads exactly one `xschemrc` at start-up, and that file decides which symbol libraries are visible and where netlists and simulation output are written. This template ships one per folder that holds schematics:

| `xschemrc` | Belongs to |
| --- | --- |
| [`schematic/xschem/xschemrc`](schematic/xschem/xschemrc) | top-level schematics |
| [`testbenches/xschem/xschemrc`](testbenches/xschem/xschemrc) | top-level testbenches |
| [`macros/inverter/schematic/xschem/xschemrc`](macros/inverter/schematic/xschem/xschemrc) | inverter schematics |
| [`macros/inverter/testbenches/xschem/xschemrc`](macros/inverter/testbenches/xschem/xschemrc) | inverter testbenches |
| [`macros/counter/schematic/xschem/xschemrc`](macros/counter/schematic/xschem/xschemrc) | counter schematics |
| [`macros/counter/testbenches/xschem/xschemrc`](macros/counter/testbenches/xschem/xschemrc) | counter testbenches |

### What Every File Does

All of them run the same four steps, in this order:

1. **Pick the PDK.** `PDK_ROOT` is probed in the usual install locations if the environment does not set it, and `PDK` falls back to `gf180mcuD` (updated from the IHP port's `ihp-sg13cmos5l` fallback). The container already exports `PDK_ROOT`, and [`.designinit`](.designinit) exports `PDK`, so this step is only a safety net for an Xschem started outside that environment.
2. **Source the PDK `xschemrc`.** `$PDK_ROOT/$PDK/libs.tech/xschem/xschemrc` brings in the gf180mcu device symbols, the ngspice model paths and the gf180mcu menu. It is guarded by `[info exists PDK]` so it is read once even when several project files are chained.
3. **Add the project library paths.** `append_xschem_library_path_unique` appends a folder to `XSCHEM_LIBRARY_PATH` only if it is not already there, so the same folder never appears twice no matter how the files are chained.
4. **Pin the netlist directory.** `pin_netlist_dir` decides where `xschem netlist` and the simulators write.

### How the Files Are Chained

```text
testbenches/xschem/xschemrc
└─ source schematic/xschem/xschemrc
   ├─ source macros/inverter/schematic/xschem/xschemrc
   └─ source macros/counter/schematic/xschem/xschemrc
```

The macro files do not source each other or the top level, so a macro can be opened and simulated on its own.

### Which File Is Used

- The Makefile targets always name one explicitly with `--rcfile`, so a target behaves the same from any working directory.
- Starting Xschem from within one of the folders above picks up that folder's file, which is the normal interactive case. `make open` does the same.
- Started from anywhere else, Xschem falls back to `~/.xschem/xschemrc` and sees neither the project symbols nor the pinned `netlist_dir`. Pass the file explicitly then, for example `xschem --rcfile schematic/xschem/xschemrc <file>`.


## Verification Scripts (`sak-*`)

The DRC, LVS, PEX, render and file-browser targets call the `sak-*` Swiss-Army-Knife scripts of the [IIC-OSIC-TOOLS](https://github.com/iic-jku/IIC-OSIC-TOOLS). They are pre-installed in the container and are on `PATH`, so the Makefiles call them by name and no copy is kept in this repository:

- `sak-drc.sh` — DRC with Magic or KLayout
- `sak-lvs.sh` — LVS with Magic + Netgen or KLayout
- `sak-pex.sh` — parasitic extraction with Magic
- `sak-pin-reorder.py` — reorders extracted `.subckt` pins to match an Xschem symbol
- `sak-render.py` — renders a layout GDS to PNG (`-t gf180mcuD` in this port's Makefiles)
- `sak-open.py` — the file browser behind `make open`
- `sak-pdk` — switches the container's active PDK, see [Selecting the PDK](#selecting-the-pdk)

They read `PDK_ROOT`, `PDK`, `PDKPATH` and `STD_CELL_LIBRARY` from the environment. The container exports `PDK_ROOT`, and [`.designinit`](.designinit) exports the other three as `gf180mcuD` / `gf180mcu_fd_sc_mcu7t5v0`. IIC-OSIC-TOOLS sources `$DESIGNS/.designinit` at start-up, so the file is picked up automatically when this repository is the mounted design directory. If the repository sits in a subfolder of `$DESIGNS`, or you are in a shell that was not started that way, source it by hand before running any target:

```sh
source .designinit
```

Only two Python helpers are kept in [`scripts/`](scripts/), both PDK-agnostic:

- [`scripts/check_boundary.py`](scripts/check_boundary.py) — the PR boundary check, see below
- [`scripts/check_pex_ports.py`](scripts/check_pex_ports.py) — checks that every port of a PEX netlist is really connected


## Makefile Targets

There are three Makefiles — this one at the repository root (the submission/top-level macro), [`macros/inverter/Makefile`](macros/inverter/Makefile) and [`macros/counter/Makefile`](macros/counter/Makefile) — and `make help` in any of the three directories prints its own live target list. The top-level and inverter Makefiles share almost the same target set (same analog flow, same parameters); the counter Makefile is structurally different because it drives a digital flow (lint → RTL/gate-level sim → LibreLane hardening → PEX) instead of DRC/LVS/PEX on a hand-drawn layout.

### Shared override variables (top level and `macros/inverter`)

| Variable | Default | Meaning |
| --- | --- | --- |
| `CELL` | `$(TOP)` | Cell name for DRC/LVS/PEX targets — override to verify a different cell inside the same layout |
| `EXT_MODE` | `3` | PEX mode: `1`=C-decoupled, `2`=C-coupled, `3`=full-RC |
| `THRESHOLD` / `MINRES` / `MINDELAY` | `10000` / `1000` / `1` | `sak-pex.sh` full-RC (`EXT_MODE=3`) extresist settings, in mOhm/mOhm/ps |
| `DRC_LEVEL` | `macro` | KLayout DRC level for `klayout-drc`: `precheck`\|`macro`\|`regular` |
| `SKIP_KLAYOUT_LVS` | `0` | Set to `1` to skip `klayout-lvs` inside `klayout-verify`/`klayout-verify-all` (see the warning below) |
| `EV_PRECISION` | `5` | Significant digits for Xschem's `ev` function during netlisting |
| `TB` | `<CELL>_tb_tran` | Testbench for `sim-xschem` |
| `SCRIPT` | `plot_<CELL>` | Plotting script for `sim-view-xschem` |
| `OPEN_ARGS` | *(empty)* | Extra flags passed to `sak-open.py` for `make open` (e.g. `--all`) |

`macros/counter` doesn't have `DRC_LEVEL`/`SKIP_KLAYOUT_LVS` (its DRC/LVS run inside the LibreLane flow instead), but adds `WAVEFORM_VIEWER` (`gtkwave`\|`surfer`, default `gtkwave`) for its `sim-view-*` targets and `FORCE=1` to let `symbol-gl` overwrite an existing symbol.

The top level additionally has `MIXED_LVS` (default `0`): set to `1` to make `magic-verify`/`magic-verify-all` call `magic-lvs-mixed` instead of plain `magic-lvs`, needed once the layout instantiates a hardened digital macro (e.g. `counter_top`), since `sak-lvs.sh` always fully flattens before extraction and would otherwise compare its real gate-level content against nothing.

> [!WARNING]
> `klayout-lvs` on any multi-finger (`nf>1`) device currently fails: gf180mcuD's KLayout LVS runset doesn't merge parallel-finger instances into one device by default, so it reports a device-count mismatch against a schematic that uses `nf>1` — even though Magic+Netgen (`magic-lvs`) correctly merges them and passes. Use `SKIP_KLAYOUT_LVS=1` and rely on `magic-lvs` until that's addressed upstream.

### Top level (this directory)

| Target | What it does |
| --- | --- |
| `help` | Show the live target list (default goal) |
| `open` | File browser for this folder via `sak-open.py` (needs the VNC/X11 desktop) |
| `pull-wrappers` | Pull `slot1_wrapper.gds`..`slot18_wrapper.gds` into `floorplan/`, see [Floorplan Templates](#floorplan-templates) |
| `top-schem SLOT=<1-18>` | Rename the `slot_<N>.sch`/`.sym`/`_pex.sym` triplet in `schematic/xschem/` to the given slot, syncing its `s<N>_an` analog I/O pin name and checking the rest of the pin set still matches `floorplan/slot<N>_wrapper.gds` |
| `top-layout SLOT=<1-18>` | Copy `floorplan/slot<N>_wrapper.gds` into `layout/` as `slot_<N>.gds`, renaming its top cell to `slot_<N>` |
| `sim-xschem [TB=]` | Run one Xschem testbench in ngspice batch mode |
| `sim-view-xschem [SCRIPT=]` | Plot a testbench's simulation results |
| `sim-all` | Run `<TOP>_tb_tran` (the only top-level testbench once the layout exists) |
| `build-inverter` | `make -C macros/inverter all` — the inverter sub-macro's full flow |
| `build-counter` | `make -C macros/counter all` — the counter sub-macro's full flow |
| `build-macros` | `build-counter` + `build-inverter` |
| `check-boundary` | PR boundary check, see [below](#pr-boundary-check) |
| `lef` / `lib` / `verilog` | Export LEF (Magic) / generate a Liberty stub / generate a Verilog stub from the PEX netlist's pins |
| `copy-gds` | Copy `layout/<TOP>.gds` → `final/gds/` |
| `render-gds` | Render `layout/<TOP>.gds` to PNG via `sak-render.py -t $(PDK)` |
| `build-top` | `check-boundary` → `lef` → `lib` → `verilog` → `copy-gds` → `render-gds` |
| `gds-fill [CELL=]` | Insert PDK-compliant dummy fill into `CELL`'s layout via `gdsfill` (backs up first). MetalTop has no native `gdsfill` support on `gf180mcuD`, so it's relabeled as Metal5 in an isolated scratch GDS and filled with `gdsfill`'s own Metal5 algorithm, then relabeled back; both that pass and the main COMP/Poly2/Metal1-5 pass replace `gdsfill`'s own Metal5 output with a tighter tiling at gf180mcu's real 0.98µm minimum dummy-to-dummy spacing, since `gdsfill`'s own (more conservative) spacing can't otherwise clear the 30% density floor |
| `gds-fill-comp [CELL=]` | Re-run `gdsfill` and copy back only the `comp_dummy` (22/4) layer, leaving every other layer's existing fill untouched (backs up first) |
| `gds-fill-undo [CELL=]` | Restore `CELL`'s layout from its most recent backup in `layout/backups/` |
| `klayout-drc` / `magic-drc [CELL=]` | DRC of `CELL` with KLayout / Magic |
| `load-drc-klayout [CELL=]` | Open the KLayout GUI with `CELL`'s layout and its `klayout-drc` report loaded (needs the VNC/X11 desktop; run `klayout-drc` first) |
| `load-drc-magic [CELL=]` | Open the Magic GUI with `CELL`'s layout loaded and DRC already run, violations highlighted (needs the VNC/X11 desktop) |
| `klayout-lvs-netlist` / `magic-lvs-netlist [CELL=]` | Export the Xschem schematic to a CDL/SPICE netlist for LVS |
| `klayout-lvs` / `magic-lvs [CELL=]` | Full LVS of `CELL` (netlist export + compare), KLayout or Magic+Netgen |
| `magic-lvs-mixed [CELL=]` | Full Magic+Netgen LVS of `CELL`, splicing in the real gate-level netlist of any digital macro it instantiates (e.g. `counter_top`) instead of black-boxing it — see the `MIXED_LVS` flag above |
| `symbol-pex [CELL=]` | Copy `<CELL>.sym` → `<CELL>_pex.sym` with `type=primitive`, for post-layout sim |
| `klayout-pex` / `magic-pex [CELL=] [EXT_MODE=]` | Parasitic extraction of `CELL`, via KPEX or Magic |
| `klayout-verify [CELL=] [SKIP_KLAYOUT_LVS=]` | `klayout-drc` + `klayout-lvs` (unless skipped) |
| `klayout-verify-all` | `klayout-verify` on `$(TOP)` |
| `magic-verify [CELL=] [MIXED_LVS=]` | `magic-drc` + (`magic-lvs-mixed` if `MIXED_LVS=1`, else `magic-lvs`) + `magic-pex` |
| `magic-verify-all` | `magic-verify` on `$(TOP)` |
| `all` | `build-macros` → `klayout-verify-all` → `magic-verify-all` → `build-top` → `sim-all` |
| `clean` | Delete the top level's generated files (`final/`, `netlist/`, `render/img/`, DRC/LVS reports, simulation outputs) |
| `clean-inverter` / `clean-counter` | `make -C macros/<name> clean` |
| `clean-macros` | Both of the above |
| `clean-all` | `clean-macros` + `clean` |

### `macros/inverter` (analog sub-macro, `TOP = inverter`)

Same targets as the top level (`open`, `lef`/`lib`/`verilog`, `copy-gds`, `render-gds`, all the `klayout-`/`magic-` DRC/LVS/PEX/verify targets, `clean`), minus `pull-wrappers`/`build-*`/`check-boundary` (those are top-level-only) and `all` simplified to `klayout-verify-all` → `magic-verify-all` → `build-top` → `sim-all` (no `build-macros` step — it has no sub-macros of its own). The differences:

| Target | What it does |
| --- | --- |
| `sim-xschem [TB=]` | Run one of the three testbenches (`inverter_tb_ac_ol`, `inverter_tb_tran`, `inverter_tb_dc_vout`) |
| `sim-cace` | Run CACE characterization (`ac_params`, `ac_mc_params` Monte Carlo, `ac_mm_params` mismatch, all `--nofail` so a spec-miss doesn't abort the chain) and collect the result plots into `verification/cace/results/inverter/` |
| `sim-all` | All three `sim-xschem` testbenches, then `sim-cace` |

### `macros/counter` (digital sub-macro, `TOP = counter_top`)

| Target | What it does |
| --- | --- |
| `help` / `open` | Same as above |
| `lint-verilog [CELL=]` / `lint-verilog-all` | Verilator lint of `CELL`'s sources / both `counter` and `counter_top` |
| `sim-rtl-verilog [CELL=]` | Icarus Verilog RTL simulation of `CELL`'s own testbench |
| `sim-view-verilog [CELL=] [WAVEFORM_VIEWER=]` | Open that testbench's waveform |
| `sim-rtl-cocotb` / `sim-gl-cocotb [CELL=]` | cocotb testbench against the RTL, or (`GL=1`) against the hardened gate-level netlist |
| `sim-view-cocotb [CELL=] [WAVEFORM_VIEWER=]` | Open the cocotb run's waveform |
| `sim-gl-xschem [CELL=] [TB=]` | Mixed-signal co-simulation: the XSPICE model + PEX netlist, driven from an Xschem testbench |
| `sim-view-xschem [SCRIPT=]` | Plot that co-simulation's results |
| `sim-all` | `sim-rtl-verilog` → `sim-rtl-cocotb` → `sim-gl-cocotb` → `sim-gl-xschem` |
| `librelane` | Run the LibreLane hardening flow (synthesis → PnR → sign-off), with Magic + KLayout DRC |
| `librelane-nodrc` / `librelane-magicdrc` / `librelane-klayoutdrc` | Same, skipping one or both DRC checkers |
| `librelane-openroad` / `librelane-klayout` | Open the last run in the OpenROAD or KLayout GUI |
| `copy-reports` | Copy yosys/antenna/STA/power/IR-drop/DRC/LVS/manufacturability reports from the last run into `verification/` |
| `copy-final` / `copy-netlist` / `copy-render` | Copy the hardened GDS/LEF/LIB/netlists, the SPICE/`.pnl`/`.nl` netlists, and the render, from the last run |
| `render-gds` | Render `final/gds/<TOP>.gds` to PNG |
| `symbol-gl [CELL=] [FORCE=1]` | Scaffold `<CELL>.sym` from the hardened netlist's ports (once, per new macro; `FORCE=1` to overwrite) |
| `symbol-check [CELL=]` | Check `<CELL>.sym` against the hardened netlist's ports (runs automatically inside `generate-xspice`) |
| `generate-xspice` | Build the XSPICE behavioral model from the hardened SPICE netlist, for mixed-signal co-simulation |
| `build-fpga` | `make -C fpga all` — FPGA emulation build |
| `build-top` | `librelane` → `copy-reports` → `copy-final` → `copy-netlist` → `generate-xspice` → `copy-render` → `render-gds` |
| `symbol-pex [CELL=]` | Same as the analog Makefiles — build `<CELL>_pex.sym` |
| `klayout-pex` / `magic-pex [CELL=] [EXT_MODE=]` | PEX of the **hardened** GDS (DRC/LVS already happened inside `librelane`, so there's no separate `klayout-drc`/`klayout-lvs` target here) |
| `all` | `lint-verilog-all` → `build-fpga` → `build-top` → `magic-pex` → `sim-all` |
| `clean` | Delete LibreLane runs, `final/`, netlists, render, reports, simulation and FPGA outputs |


### PR Boundary Check

Checks that the top cell of `layout/<TOP>.gds` draws the PR boundary box on layer 0 (`pr_bndry`). `build-top` runs it first:

```sh
make check-boundary
```

The chip flow derives the bounding box of every macro from this layer: Magic maps all datatypes of layer 0 to its boundary, and LibreLane's `Magic.StreamOut` runs `get_bbox.tcl` on every macro it places. The box comes with the floorplan templates in `floorplan/` (modulo the caveat above), so treat it as part of the layout: never delete it as clutter, keep it in the KLayout editing source so every re-export carries it.

> [!NOTE]
> This layer number is PDK-specific, not a universal chip-flow constant: the IHP sg13cmos5l template this port descends from used layer 189 for its `prBoundary`. `scripts/check_boundary.py` was carrying that IHP value over unfixed (`BOUNDARY_LAYER = 189`) until this was caught — it's now `0`, matching gf180mcuD's actual `pr_bndry` layer (`generic_layers.rb`: `extract_single_layer_from_design.call(:pr_bndry, 0, 0)`).


## License

Copyright 2026 Tim Edwards and Simon Dorrer.

Licensed under the **Solderpad Hardware License v2.1** (`Apache-2.0 WITH SHL-2.1`), see [`LICENSE`](LICENSE). Source files carry an `SPDX-FileCopyrightText` header; layout data, netlists, renders and generated reports cannot carry one and are covered by this notice.
