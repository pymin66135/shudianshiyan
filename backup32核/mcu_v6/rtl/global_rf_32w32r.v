//============================================================
// Module: global_rf_32w32r
// Description: 64x16 global register file with 32 combinational read ports
//              and 32 synchronous write ports for V5.2 32-core design.
//============================================================
`timescale 1ns/1ps

module global_rf_32w32r (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [5:0]  raddr0,
    output wire [15:0] rdata0,
    input  wire [5:0]  raddr1,
    output wire [15:0] rdata1,
    input  wire [5:0]  raddr2,
    output wire [15:0] rdata2,
    input  wire [5:0]  raddr3,
    output wire [15:0] rdata3,
    input  wire [5:0]  raddr4,
    output wire [15:0] rdata4,
    input  wire [5:0]  raddr5,
    output wire [15:0] rdata5,
    input  wire [5:0]  raddr6,
    output wire [15:0] rdata6,
    input  wire [5:0]  raddr7,
    output wire [15:0] rdata7,
    input  wire [5:0]  raddr8,
    output wire [15:0] rdata8,
    input  wire [5:0]  raddr9,
    output wire [15:0] rdata9,
    input  wire [5:0]  raddr10,
    output wire [15:0] rdata10,
    input  wire [5:0]  raddr11,
    output wire [15:0] rdata11,
    input  wire [5:0]  raddr12,
    output wire [15:0] rdata12,
    input  wire [5:0]  raddr13,
    output wire [15:0] rdata13,
    input  wire [5:0]  raddr14,
    output wire [15:0] rdata14,
    input  wire [5:0]  raddr15,
    output wire [15:0] rdata15,
    input  wire [5:0]  raddr16,
    output wire [15:0] rdata16,
    input  wire [5:0]  raddr17,
    output wire [15:0] rdata17,
    input  wire [5:0]  raddr18,
    output wire [15:0] rdata18,
    input  wire [5:0]  raddr19,
    output wire [15:0] rdata19,
    input  wire [5:0]  raddr20,
    output wire [15:0] rdata20,
    input  wire [5:0]  raddr21,
    output wire [15:0] rdata21,
    input  wire [5:0]  raddr22,
    output wire [15:0] rdata22,
    input  wire [5:0]  raddr23,
    output wire [15:0] rdata23,
    input  wire [5:0]  raddr24,
    output wire [15:0] rdata24,
    input  wire [5:0]  raddr25,
    output wire [15:0] rdata25,
    input  wire [5:0]  raddr26,
    output wire [15:0] rdata26,
    input  wire [5:0]  raddr27,
    output wire [15:0] rdata27,
    input  wire [5:0]  raddr28,
    output wire [15:0] rdata28,
    input  wire [5:0]  raddr29,
    output wire [15:0] rdata29,
    input  wire [5:0]  raddr30,
    output wire [15:0] rdata30,
    input  wire [5:0]  raddr31,
    output wire [15:0] rdata31,
    input  wire [5:0]  waddr0,
    input  wire [15:0] wdata0,
    input  wire        we0,
    input  wire [5:0]  waddr1,
    input  wire [15:0] wdata1,
    input  wire        we1,
    input  wire [5:0]  waddr2,
    input  wire [15:0] wdata2,
    input  wire        we2,
    input  wire [5:0]  waddr3,
    input  wire [15:0] wdata3,
    input  wire        we3,
    input  wire [5:0]  waddr4,
    input  wire [15:0] wdata4,
    input  wire        we4,
    input  wire [5:0]  waddr5,
    input  wire [15:0] wdata5,
    input  wire        we5,
    input  wire [5:0]  waddr6,
    input  wire [15:0] wdata6,
    input  wire        we6,
    input  wire [5:0]  waddr7,
    input  wire [15:0] wdata7,
    input  wire        we7,
    input  wire [5:0]  waddr8,
    input  wire [15:0] wdata8,
    input  wire        we8,
    input  wire [5:0]  waddr9,
    input  wire [15:0] wdata9,
    input  wire        we9,
    input  wire [5:0]  waddr10,
    input  wire [15:0] wdata10,
    input  wire        we10,
    input  wire [5:0]  waddr11,
    input  wire [15:0] wdata11,
    input  wire        we11,
    input  wire [5:0]  waddr12,
    input  wire [15:0] wdata12,
    input  wire        we12,
    input  wire [5:0]  waddr13,
    input  wire [15:0] wdata13,
    input  wire        we13,
    input  wire [5:0]  waddr14,
    input  wire [15:0] wdata14,
    input  wire        we14,
    input  wire [5:0]  waddr15,
    input  wire [15:0] wdata15,
    input  wire        we15,
    input  wire [5:0]  waddr16,
    input  wire [15:0] wdata16,
    input  wire        we16,
    input  wire [5:0]  waddr17,
    input  wire [15:0] wdata17,
    input  wire        we17,
    input  wire [5:0]  waddr18,
    input  wire [15:0] wdata18,
    input  wire        we18,
    input  wire [5:0]  waddr19,
    input  wire [15:0] wdata19,
    input  wire        we19,
    input  wire [5:0]  waddr20,
    input  wire [15:0] wdata20,
    input  wire        we20,
    input  wire [5:0]  waddr21,
    input  wire [15:0] wdata21,
    input  wire        we21,
    input  wire [5:0]  waddr22,
    input  wire [15:0] wdata22,
    input  wire        we22,
    input  wire [5:0]  waddr23,
    input  wire [15:0] wdata23,
    input  wire        we23,
    input  wire [5:0]  waddr24,
    input  wire [15:0] wdata24,
    input  wire        we24,
    input  wire [5:0]  waddr25,
    input  wire [15:0] wdata25,
    input  wire        we25,
    input  wire [5:0]  waddr26,
    input  wire [15:0] wdata26,
    input  wire        we26,
    input  wire [5:0]  waddr27,
    input  wire [15:0] wdata27,
    input  wire        we27,
    input  wire [5:0]  waddr28,
    input  wire [15:0] wdata28,
    input  wire        we28,
    input  wire [5:0]  waddr29,
    input  wire [15:0] wdata29,
    input  wire        we29,
    input  wire [5:0]  waddr30,
    input  wire [15:0] wdata30,
    input  wire        we30,
    input  wire [5:0]  waddr31,
    input  wire [15:0] wdata31,
    input  wire        we31
);

reg [15:0] regs [0:63];
integer i;

assign rdata0 = regs[raddr0];
assign rdata1 = regs[raddr1];
assign rdata2 = regs[raddr2];
assign rdata3 = regs[raddr3];
assign rdata4 = regs[raddr4];
assign rdata5 = regs[raddr5];
assign rdata6 = regs[raddr6];
assign rdata7 = regs[raddr7];
assign rdata8 = regs[raddr8];
assign rdata9 = regs[raddr9];
assign rdata10 = regs[raddr10];
assign rdata11 = regs[raddr11];
assign rdata12 = regs[raddr12];
assign rdata13 = regs[raddr13];
assign rdata14 = regs[raddr14];
assign rdata15 = regs[raddr15];
assign rdata16 = regs[raddr16];
assign rdata17 = regs[raddr17];
assign rdata18 = regs[raddr18];
assign rdata19 = regs[raddr19];
assign rdata20 = regs[raddr20];
assign rdata21 = regs[raddr21];
assign rdata22 = regs[raddr22];
assign rdata23 = regs[raddr23];
assign rdata24 = regs[raddr24];
assign rdata25 = regs[raddr25];
assign rdata26 = regs[raddr26];
assign rdata27 = regs[raddr27];
assign rdata28 = regs[raddr28];
assign rdata29 = regs[raddr29];
assign rdata30 = regs[raddr30];
assign rdata31 = regs[raddr31];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0; i < 64; i = i + 1) regs[i] <= 16'b0;
    end else begin
        if (we0) regs[waddr0] <= wdata0;
        if (we1) regs[waddr1] <= wdata1;
        if (we2) regs[waddr2] <= wdata2;
        if (we3) regs[waddr3] <= wdata3;
        if (we4) regs[waddr4] <= wdata4;
        if (we5) regs[waddr5] <= wdata5;
        if (we6) regs[waddr6] <= wdata6;
        if (we7) regs[waddr7] <= wdata7;
        if (we8) regs[waddr8] <= wdata8;
        if (we9) regs[waddr9] <= wdata9;
        if (we10) regs[waddr10] <= wdata10;
        if (we11) regs[waddr11] <= wdata11;
        if (we12) regs[waddr12] <= wdata12;
        if (we13) regs[waddr13] <= wdata13;
        if (we14) regs[waddr14] <= wdata14;
        if (we15) regs[waddr15] <= wdata15;
        if (we16) regs[waddr16] <= wdata16;
        if (we17) regs[waddr17] <= wdata17;
        if (we18) regs[waddr18] <= wdata18;
        if (we19) regs[waddr19] <= wdata19;
        if (we20) regs[waddr20] <= wdata20;
        if (we21) regs[waddr21] <= wdata21;
        if (we22) regs[waddr22] <= wdata22;
        if (we23) regs[waddr23] <= wdata23;
        if (we24) regs[waddr24] <= wdata24;
        if (we25) regs[waddr25] <= wdata25;
        if (we26) regs[waddr26] <= wdata26;
        if (we27) regs[waddr27] <= wdata27;
        if (we28) regs[waddr28] <= wdata28;
        if (we29) regs[waddr29] <= wdata29;
        if (we30) regs[waddr30] <= wdata30;
        if (we31) regs[waddr31] <= wdata31;
    end
end

endmodule
