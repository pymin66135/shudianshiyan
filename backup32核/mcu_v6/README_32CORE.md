# MCU V5.2 32-core Safe-NOP Dual-Port Top

This version is derived from `mcu_v5_safe_nop_dualport_top_fix` and expands the sorter from 16 cores to 32 cores.

## Main changes

- `rtl/top.v`: 32 `mcu_top` instances, `DONE_PC_CORE00..31`, `all_cores_done` updated.
- `rtl/global_rf_32w32r.v`: 64 x 16-bit global register file with 32 combinational read ports and 32 synchronous write ports.
- `programs/core_00.hex` .. `programs/core_31.hex`: regenerated 32-core lockstep programs.
- `scripts/make_opt_v52_32core.py`: regenerates all 32 core programs.
- `tb/tb_top_v5_32core.v`: deterministic signed full64 checker.
- `run_sim.tcl`: updated to use the 32-core files.

## Program schedule

- Sorting network: Batcher-64.
- Compare-swap pairs: 543.
- Topology layers: 21.
- Each layer maps to at most 32 independent CAS operations, one per core.
- Each core executes `126` instructions.
- DONE_PC for every core: `32'h000001F8`.
- CAS template: `LDR R0`, `LDR R1`, `CMP R0,R1`, `STRGT R1`, `STRGT R0`, followed by one safe NOP slot.

## Notes

1. This is a high-parallelism exploration version. The functional design is straightforward, but timing may be much harder than 16-core because `global_rf_32w32r` creates a much wider star interconnect.
2. The `PROGRAM_FILE` paths in `rtl/top.v` are relative: `programs/core_XX.hex`. Run Vivado/Tcl from this folder, or change paths to your local absolute project path.
3. Keep `test_ROM` and `verify_RAM` configured as true dual-port IPs, same as the uploaded 16-core dual-port fix version.
4. I could not run Vivado implementation in this environment. Please run behavioral simulation and then implementation locally on your Vivado/Kintex-7 project.
