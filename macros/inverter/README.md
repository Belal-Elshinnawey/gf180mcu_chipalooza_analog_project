# gf180mcu Inverter

> [!WARNING]
> This sub-macro is a placeholder. The original `ihp-sg13cmos5l` port of this template shipped a
> complete inverter unit cell here (schematic, transistor sizing, layout, DRC/LVS/PEX, CACE
> characterization). That design is specific to IHP's sg13cmos5l devices and was removed rather
> than carried over broken, because this macro is about to be replaced with a new analog cell
> built for the gf180mcu PDK to test this template end-to-end.
>
> What **is** carried over and already PDK-correct:
> - [`Makefile`](Makefile) — same targets as the top-level [`Makefile`](../../Makefile) (`TOP =
>   inverter`), with the Magic `.magicrc` path and `sak-render.py -t` flag generalized to
>   `$(PDK)`/`gf180mcuD`.
> - [`schematic/xschem/xschemrc`](schematic/xschem/xschemrc),
>   [`testbenches/xschem/xschemrc`](testbenches/xschem/xschemrc) — PDK picked up from the
>   environment / [`.designinit`](../../.designinit) (`gf180mcuD`).
> - [`scripts/check_pex_ports.py`](scripts/check_pex_ports.py) — PDK-agnostic.
> - [`testbenches/xschem/plot_simulations/ngspice2python.py`](testbenches/xschem/plot_simulations/ngspice2python.py) — PDK-agnostic plotting helper.
>
> What's missing until the replacement macro is designed: `schematic/xschem/inverter.sch`/`.sym`,
> `layout/inverter.gds`, the testbench `.sch` files and their plot script, `verification/`
> (DRC/LVS/CACE), `netlist/`, `final/` and `render/`. See the top-level
> [`README.md`](../../README.md#recursive-macro-structure) for how this sub-macro plugs into the
> top-level flow, and [`README.md`](../../README.md#makefile-targets) for what every Makefile
> target here does once the design exists.
