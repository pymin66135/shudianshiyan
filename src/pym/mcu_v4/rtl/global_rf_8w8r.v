//============================================================
// Module: global_rf_8w8r
// Description:
//   Global register file for V4.0 8-core sorting architecture.
//   64 depth x 16-bit, 8 read ports (combinational), 8 write ports (sync).
//
//   Storage: reg [15:0] regs [0:63]
//   Write priority: port0 > port1 > ... > port7
//   (Static scheduling guarantees no same-address conflicts.)
//============================================================

`timescale 1ns/1ps

module global_rf_8w8r (
    input  wire        clk,
    input  wire        rst_n,

    // ---- Read ports (combinational) ----
    input  wire [5:0]  raddr0, raddr1, raddr2, raddr3,
    input  wire [5:0]  raddr4, raddr5, raddr6, raddr7,
    output wire [15:0] rdata0, rdata1, rdata2, rdata3,
    output wire [15:0] rdata4, rdata5, rdata6, rdata7,

    // ---- Write ports (synchronous, posedge clk) ----
    input  wire [5:0]  waddr0, waddr1, waddr2, waddr3,
    input  wire [5:0]  waddr4, waddr5, waddr6, waddr7,
    input  wire [15:0] wdata0, wdata1, wdata2, wdata3,
    input  wire [15:0] wdata4, wdata5, wdata6, wdata7,
    input  wire        we0, we1, we2, we3,
    input  wire        we4, we5, we6, we7
);

//============================================================
// Register array: 64 x 16-bit
//============================================================
reg [15:0] regs [0:63];
integer i;

//============================================================
// Combinational read ports
//============================================================
assign rdata0 = regs[raddr0];
assign rdata1 = regs[raddr1];
assign rdata2 = regs[raddr2];
assign rdata3 = regs[raddr3];
assign rdata4 = regs[raddr4];
assign rdata5 = regs[raddr5];
assign rdata6 = regs[raddr6];
assign rdata7 = regs[raddr7];

//============================================================
// Synchronous write ports (priority 0 > 1 > ... > 7)
//============================================================
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0; i < 64; i = i + 1) begin
            regs[i] <= 16'b0;
        end
    end else begin
        if (we0) regs[waddr0] <= wdata0;
        if (we1) regs[waddr1] <= wdata1;
        if (we2) regs[waddr2] <= wdata2;
        if (we3) regs[waddr3] <= wdata3;
        if (we4) regs[waddr4] <= wdata4;
        if (we5) regs[waddr5] <= wdata5;
        if (we6) regs[waddr6] <= wdata6;
        if (we7) regs[waddr7] <= wdata7;
    end
end

endmodule // global_rf_8w8r
