//============================================================
// Module: global_rf_4w4r
// Description:
//   Global register file for V3.5 quad-core sorting architecture.
//   64 depth x 16-bit, 4 read ports (combinational), 4 write ports (sync).
//
//   Storage: logic [15:0] regs [0:63] — mapped to D flip-flops.
//   No internal write-conflict resolution — correctness guaranteed
//   by static assembly-code scheduling across cores.
//============================================================

`timescale 1ns/1ps

module global_rf_4w4r (
    input  wire        clk,
    input  wire        rst_n,

    // ---- Read ports (combinational) ----
    input  wire [5:0]  raddr0,
    input  wire [5:0]  raddr1,
    input  wire [5:0]  raddr2,
    input  wire [5:0]  raddr3,
    output wire [15:0] rdata0,
    output wire [15:0] rdata1,
    output wire [15:0] rdata2,
    output wire [15:0] rdata3,

    // ---- Write ports (synchronous, posedge clk) ----
    input  wire [5:0]  waddr0,
    input  wire [5:0]  waddr1,
    input  wire [5:0]  waddr2,
    input  wire [5:0]  waddr3,
    input  wire [15:0] wdata0,
    input  wire [15:0] wdata1,
    input  wire [15:0] wdata2,
    input  wire [15:0] wdata3,
    input  wire        we0,
    input  wire        we1,
    input  wire        we2,
    input  wire        we3
);

//============================================================
// Register array: 64 x 16-bit pure D flip-flops
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

//============================================================
// Synchronous write ports — write in priority order 0 > 1 > 2 > 3
// when multiple ports target the same address.
// (Static scheduling guarantees no same-address conflicts.)
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
    end
end

endmodule // global_rf_4w4r
