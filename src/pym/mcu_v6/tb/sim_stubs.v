//============================================================
// Module: sim_stubs.v
// Description:
//   Behavioral simulation stubs for Vivado IP blocks used in
//   the V5 16-core dual-port top-level simulation.
//   Include this file in simulation ONLY — do NOT include it in synthesis.
//============================================================

`timescale 1ns/1ps

module sys_clk (
    output wire clk_out1,
    input  wire clk_in1
);
    assign clk_out1 = clk_in1;
endmodule

// True-dual-port 64x16 ROM model.
// Backdoor: tb calls dut.u_test_ROM.backdoor_write(addr, data) before reset.
module test_ROM (
    input  wire        clka,
    input  wire        ena,
    input  wire [5:0]  addra,
    output reg  [15:0] douta,
    input  wire        clkb,
    input  wire        enb,
    input  wire [5:0]  addrb,
    output reg  [15:0] doutb
);
    reg [15:0] mem [0:63];

    // Backdoor write task — called from testbench before reset
    task backdoor_write;
        input [5:0] addr;
        input [15:0] data;
        mem[addr] = data;
    endtask

    always @(posedge clka) begin
        if (ena) douta <= mem[addra];
    end

    always @(posedge clkb) begin
        if (enb) doutb <= mem[addrb];
    end
endmodule

// True-dual-port 64x16 RAM model.
// Backdoor: tb may read dut.u_verify_RAM.mem[i] after DONE.
module verify_RAM (
    input  wire        clka,
    input  wire        ena,
    input  wire [0:0]  wea,
    input  wire [5:0]  addra,
    input  wire [15:0] dina,
    output reg  [15:0] douta,
    input  wire        clkb,
    input  wire        enb,
    input  wire [0:0]  web,
    input  wire [5:0]  addrb,
    input  wire [15:0] dinb,
    output reg  [15:0] doutb
);
    reg [15:0] mem [0:63];

    always @(posedge clka) begin
        if (ena) begin
            if (wea) mem[addra] <= dina;
            douta <= mem[addra];
        end
    end

    always @(posedge clkb) begin
        if (enb) begin
            if (web) mem[addrb] <= dinb;
            doutb <= mem[addrb];
        end
    end
endmodule

module ila_0 (
    input  wire        clk,
    input  wire [15:0] probe0,
    input  wire [15:0] probe1,
    input  wire [19:0] probe2,
    input  wire [2:0]  probe3,
    input  wire [31:0] probe4
);
endmodule
