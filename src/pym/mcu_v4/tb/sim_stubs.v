//============================================================
// Module: sim_stubs.v
// Description:
//   Behavioral simulation stubs for Vivado IP blocks used in
//   the V3.5 quad-core design.  Include this file in simulation
//   ONLY — do NOT include it in synthesis.
//
//   Stubs provided:
//     sys_clk   — clock wizard (pass-through)
//     test_ROM  — 64×16-bit ROM (backdoor-writable for tb)
//     verify_RAM — 64×16-bit RAM (backdoor-readable for tb)
//     ila_0     — ILA (no-op in simulation)
//============================================================

`timescale 1ns/1ps

//============================================================
// sys_clk — clock wizard stub
// In simulation we just pass the oscillator through.
//============================================================
module sys_clk (
    output wire clk_out1,
    input  wire clk_in1
);
    assign clk_out1 = clk_in1;
endmodule // sys_clk

//============================================================
// test_ROM — simple 64×16-bit ROM for test vector storage.
// Backdoor: tb can write dut.u_test_ROM.mem[i] before reset.
//============================================================
module test_ROM (
    input  wire        clka,
    input  wire        ena,
    input  wire [5:0]  addra,
    output reg  [15:0] douta
);

    reg [15:0] mem [0:63];

    always @(posedge clka) begin
        if (ena) begin
            douta <= mem[addra];
        end
    end
endmodule // test_ROM

//============================================================
// verify_RAM — simple 64×16-bit RAM for result verification.
// Backdoor: tb can read dut.u_verify_RAM.mem[i] after DONE.
//============================================================
module verify_RAM (
    input  wire        clka,
    input  wire        ena,
    input  wire [0:0]  wea,
    input  wire [5:0]  addra,
    input  wire [15:0] dina,
    output reg  [15:0] douta
);

    reg [15:0] mem [0:63];

    always @(posedge clka) begin
        if (ena) begin
            if (wea) begin
                mem[addra] <= dina;
            end
            douta <= mem[addra];
        end
    end
endmodule // verify_RAM

//============================================================
// ila_0 — ILA stub (no-op in simulation)
//============================================================
module ila_0 (
    input  wire        clk,
    input  wire [15:0] probe0,
    input  wire [15:0] probe1,
    input  wire [19:0] probe2,
    input  wire [2:0]  probe3,
    input  wire [31:0] probe4
);
    // intentionally empty — ILA is for hardware debug only
endmodule // ila_0
