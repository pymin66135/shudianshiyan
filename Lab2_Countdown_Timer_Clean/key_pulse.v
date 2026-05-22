`timescale 1ns / 1ps
// ============================================================
// File: key_pulse.v
// Function:
//   Debounce an active-low push button and generate a one-clock
//   pulse for each valid press.
//
// Board key assumption:
//   key_in = 1 : released
//   key_in = 0 : pressed
// ============================================================

module key_pulse #(
    parameter integer CNT_MAX = 1_000_000   // 20 ms at 50 MHz
)(
    input  wire clk,
    input  wire key_in,
    output reg  key_pulse
);

    reg key_sync_0 = 1'b1;
    reg key_sync_1 = 1'b1;

    reg key_stable      = 1'b0;  // debounced pressed state
    reg key_stable_prev = 1'b0;

    reg [20:0] cnt = 21'd0;

    wire key_pressed;
    assign key_pressed = ~key_sync_1;

    // 1. Synchronize raw key to clock domain
    always @(posedge clk) begin
        key_sync_0 <= key_in;
        key_sync_1 <= key_sync_0;
    end

    // 2. Debounce
    always @(posedge clk) begin
        if (key_pressed == key_stable) begin
            cnt <= 21'd0;
        end else begin
            if (cnt >= CNT_MAX - 1) begin
                key_stable <= key_pressed;
                cnt <= 21'd0;
            end else begin
                cnt <= cnt + 1'b1;
            end
        end
    end

    // 3. Rising edge detection of debounced "pressed" signal
    always @(posedge clk) begin
        key_stable_prev <= key_stable;

        if (key_stable == 1'b1 && key_stable_prev == 1'b0)
            key_pulse <= 1'b1;
        else
            key_pulse <= 1'b0;
    end

endmodule
