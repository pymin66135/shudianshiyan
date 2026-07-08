//============================================================
// Module: global_rf_16w16r
// Description:
//   Global register file for V5.0 16-core sorting architecture.
//   64 depth x 16-bit, 16 read ports (combinational), 16 write ports (sync).
//
//   Storage: reg [15:0] regs [0:63]
//   Write priority: port0 > port1 > ... > port15
//============================================================

`timescale 1ns/1ps

module global_rf_16w16r (
    input  wire        clk,
    input  wire        rst_n,

    // ---- Read ports (combinational) ----
    input  wire [5:0]  raddr0, raddr1, raddr2, raddr3,
    input  wire [5:0]  raddr4, raddr5, raddr6, raddr7,
    input  wire [5:0]  raddr8, raddr9, raddr10, raddr11,
    input  wire [5:0]  raddr12, raddr13, raddr14, raddr15,
    output wire [15:0] rdata0, rdata1, rdata2, rdata3,
    output wire [15:0] rdata4, rdata5, rdata6, rdata7,
    output wire [15:0] rdata8, rdata9, rdata10, rdata11,
    output wire [15:0] rdata12, rdata13, rdata14, rdata15,

    // ---- Write ports (synchronous, posedge clk) ----
    input  wire [5:0]  waddr0, waddr1, waddr2, waddr3,
    input  wire [5:0]  waddr4, waddr5, waddr6, waddr7,
    input  wire [5:0]  waddr8, waddr9, waddr10, waddr11,
    input  wire [5:0]  waddr12, waddr13, waddr14, waddr15,
    input  wire [15:0] wdata0, wdata1, wdata2, wdata3,
    input  wire [15:0] wdata4, wdata5, wdata6, wdata7,
    input  wire [15:0] wdata8, wdata9, wdata10, wdata11,
    input  wire [15:0] wdata12, wdata13, wdata14, wdata15,
    input  wire        we0, we1, we2, we3,
    input  wire        we4, we5, we6, we7,
    input  wire        we8, we9, we10, we11,
    input  wire        we12, we13, we14, we15
);

reg [15:0] regs [0:63];
integer i;

assign rdata0  = regs[raddr0];  assign rdata1  = regs[raddr1];
assign rdata2  = regs[raddr2];  assign rdata3  = regs[raddr3];
assign rdata4  = regs[raddr4];  assign rdata5  = regs[raddr5];
assign rdata6  = regs[raddr6];  assign rdata7  = regs[raddr7];
assign rdata8  = regs[raddr8];  assign rdata9  = regs[raddr9];
assign rdata10 = regs[raddr10]; assign rdata11 = regs[raddr11];
assign rdata12 = regs[raddr12]; assign rdata13 = regs[raddr13];
assign rdata14 = regs[raddr14]; assign rdata15 = regs[raddr15];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0; i < 64; i = i + 1) regs[i] <= 16'b0;
    end else begin
        if (we0)  regs[waddr0]  <= wdata0;
        if (we1)  regs[waddr1]  <= wdata1;
        if (we2)  regs[waddr2]  <= wdata2;
        if (we3)  regs[waddr3]  <= wdata3;
        if (we4)  regs[waddr4]  <= wdata4;
        if (we5)  regs[waddr5]  <= wdata5;
        if (we6)  regs[waddr6]  <= wdata6;
        if (we7)  regs[waddr7]  <= wdata7;
        if (we8)  regs[waddr8]  <= wdata8;
        if (we9)  regs[waddr9]  <= wdata9;
        if (we10) regs[waddr10] <= wdata10;
        if (we11) regs[waddr11] <= wdata11;
        if (we12) regs[waddr12] <= wdata12;
        if (we13) regs[waddr13] <= wdata13;
        if (we14) regs[waddr14] <= wdata14;
        if (we15) regs[waddr15] <= wdata15;
    end
end

endmodule
