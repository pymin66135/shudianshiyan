# V2_pipe3_io_forward_180

## Source
- baseline: `P4_sort_opt_pipe3`
- new location: `C:\Users\15756\Desktop\mcupipe3\V2_pipe3_io_forward`
- sort program: unchanged from P4
- DONE_PC: unchanged, `0x000028B4`
- verified point: 180 MHz, `cnt_test = 2739`, `total_time ~= 15.22 us`

## Version Meaning
- microarchitecture: three-stage pipeline MCU with IO and forwarding cleanup
- test_ROM load: streamed address issue with aligned write-back into internal data_mem
- verify_RAM write-back: continuous one-word-per-cycle write stream
- flags forwarding: explicit `flag_forward_valid` and `flags_forwarded`
- reg_file bypass: same-cycle write/read bypass for R0-R14

## Not Implemented
- dual issue
- CSWAP or any custom sorting instruction
- macro-op fusion
- one-cycle compare-swap hardware
- dual-port data_mem
- multicore or sorting network

## Vivado Steps
1. Open Vivado 2022.2.
2. From this directory, run: `source scripts/create_project.tcl`.
3. Run simulation with: `source scripts/run_sim.tcl`.
4. Run synthesis/implementation with: `source scripts/run_synth_impl.tcl`.

Generated Vivado work files are intentionally not kept in this cleaned source tree. Treat Tcl recreation as the source of truth.

## Expected Metrics To Record
- simulation_pass
- total_errors
- cnt_test: 2739
- target_freq_mhz: 180
- WNS/WHS
- LUT/FF/BRAM
- total_time = cnt_test / frequency
