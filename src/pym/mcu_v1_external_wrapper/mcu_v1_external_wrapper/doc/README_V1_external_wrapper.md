# MCU V1 external wrapper package

This package adds the V1 board-level wrapper for the sorting course project.

## Design flow implemented

`top.v` implements:

1. `test_ROM` -> `test_vector_in`
2. sign-extend each 16-bit input to one 32-bit internal `data_mem` word
3. release `mcu_top` and run the MCU sorting program
4. read sorted internal `data_mem`
5. write 64 outputs to `verify_RAM` through `verify_vector_out`
6. stop `cnt_test` after the final `verify_RAM` write

## Important files

### RTL / Design Sources

Add these files to Vivado Design Sources:

- `rtl/top.v`
- `rtl/mcu_top.v`
- `rtl/data_mem.v`
- `rtl/pc_reg.v`
- `rtl/reg_file.v`
- `rtl/alu.v`
- `rtl/branch_unit.v`
- `rtl/cnt_test.v`
- `rtl/cond_unit.v`
- `rtl/control_unit.v`
- `rtl/instr_rom.v`
- `rtl/operand2_decode.v`

Also keep the real Vivado IP cores/wrappers in the project:

- `sys_clk`
- `test_ROM`
- `verify_RAM`
- `ila_0`

Set `top` as the design top module for board implementation.

### Simulation Sources

Add this file to Simulation Sources only:

- `tb/tb_top_v1_smoke.v`

This testbench contains behavioral stubs for `sys_clk`, `test_ROM`, `verify_RAM`, and `ila_0`.
Do not add it to Design Sources when the real IP wrappers are present.

## ILA configuration

Regenerate/configure `ila_0` with 7 probes:

- `probe0`: 16 bits, `test_vector_in`
- `probe1`: 16 bits, `verify_vector_out`
- `probe2`: 20 bits, `cnt_test`
- `probe3`: 3 bits, `state`
- `probe4`: 1 bit, `verify_ram_we`
- `probe5`: 1 bit, `done`
- `probe6`: 8 bits, `debug_pc[9:2]`

This is intentionally small to reduce timing pressure.

## DONE_PC

`top.v` defaults to:

```verilog
parameter DONE_PC = 32'h000000FF;
```

The comparison is word-based:

```verilog
assign mcu_done = (debug_pc[31:2] == DONE_PC[31:2]);
```

So `0xFF` matches the aligned PC word containing `0xFC`.
For the current built-in sort8 program, the testbench overrides `DONE_PC = 32'h0000003C`.

## Current simulation limitation

The included smoke test uses the current built-in `sort8_u16_unsigned` program. It proves the V1 wrapper flow but does not prove the final 64 signed sorting algorithm.

After the real 64 signed program is generated:

1. Set `PROGRAM_FROM_FILE = 1`.
2. Set `PROGRAM_FILE` to your 64 signed `.hex`.
3. Set `DONE_PC` to the final program DONE-loop PC convention.
4. Replace the smoke dataset/checks with signed 64-element random and boundary tests.
