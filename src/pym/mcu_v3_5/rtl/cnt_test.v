//============================================================
// Module: cnt_test (V3.5 — unchanged)
// Description:
//   20-bit cycle counter for performance measurement.
//============================================================

`timescale 1ns/1ps

module cnt_test (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        start_flag,
    input  wire        stop_flag,
    output reg  [19:0] cnt_test
);

reg is_running;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        is_running <= 1'b0;
    end else if (start_flag) begin
        is_running <= 1'b1;
    end else if (stop_flag) begin
        is_running <= 1'b0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt_test <= 20'd0;
    end else if (is_running) begin
        cnt_test <= cnt_test + 1'b1;
    end
end

endmodule // cnt_test
