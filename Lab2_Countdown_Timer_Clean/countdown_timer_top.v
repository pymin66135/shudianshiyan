`timescale 1ns / 1ps
// ============================================================
// File: countdown_timer_top.v
// Top module: countdown_timer_top
//
// Lab2 Countdown Timer
//   KEY1: start / pause
//   KEY2: reset
//   KEY3: add time
//   KEY4: subtract time
//
// This version is self-contained and directly uses the 50 MHz
// board clock. No clk_wiz IP is required.
// ============================================================

module countdown_timer_top(
    input  wire clk,          // CLK_50M, G22

    input  wire key_start,    // KEY1: start / pause
    input  wire key_reset,    // KEY2: reset
    input  wire key_add,      // KEY3: add time
    input  wire key_sub,      // KEY4: subtract time

    output reg  [3:0] seg_sel,
    output wire [7:0] seg_output
);

    // =========================================================
    // 1. Parameters
    // =========================================================

    localparam integer CLK_FREQ_HZ = 50_000_000;

    localparam [6:0] DEFAULT_TIME = 7'd10;
    localparam [6:0] MAX_TIME     = 7'd60;

    localparam [1:0] IDLE    = 2'd0;
    localparam [1:0] RUNNING = 2'd1;
    localparam [1:0] PAUSED  = 2'd2;
    localparam [1:0] DONE    = 2'd3;


    // =========================================================
    // 2. Key debounce and pulse generation
    // =========================================================

    wire start_pulse;
    wire reset_pulse;
    wire add_pulse;
    wire sub_pulse;

    key_pulse #(.CNT_MAX(1_000_000)) u_key_start (
        .clk(clk),
        .key_in(key_start),
        .key_pulse(start_pulse)
    );

    key_pulse #(.CNT_MAX(1_000_000)) u_key_reset (
        .clk(clk),
        .key_in(key_reset),
        .key_pulse(reset_pulse)
    );

    key_pulse #(.CNT_MAX(1_000_000)) u_key_add (
        .clk(clk),
        .key_in(key_add),
        .key_pulse(add_pulse)
    );

    key_pulse #(.CNT_MAX(1_000_000)) u_key_sub (
        .clk(clk),
        .key_in(key_sub),
        .key_pulse(sub_pulse)
    );


    // =========================================================
    // 3. One-second tick generator
    // =========================================================

    reg [25:0] sec_cnt = 26'd0;
    reg one_sec_tick = 1'b0;

    always @(posedge clk) begin
        if (sec_cnt == CLK_FREQ_HZ - 1) begin
            sec_cnt <= 26'd0;
            one_sec_tick <= 1'b1;
        end else begin
            sec_cnt <= sec_cnt + 1'b1;
            one_sec_tick <= 1'b0;
        end
    end


    // =========================================================
    // 4. Countdown state machine
    // =========================================================

    reg [1:0] state = IDLE;
    reg [6:0] time_left = DEFAULT_TIME;

    always @(posedge clk) begin
        if (reset_pulse) begin
            state <= IDLE;
            time_left <= DEFAULT_TIME;
        end else begin
            case (state)

                // ---------------------------------------------
                // IDLE: setting / waiting
                // ---------------------------------------------
                IDLE: begin
                    if (add_pulse) begin
                        if (time_left < MAX_TIME)
                            time_left <= time_left + 1'b1;
                    end else if (sub_pulse) begin
                        if (time_left > 7'd0)
                            time_left <= time_left - 1'b1;
                    end else if (start_pulse) begin
                        if (time_left > 7'd0)
                            state <= RUNNING;
                    end
                end

                // ---------------------------------------------
                // RUNNING: countdown
                // ---------------------------------------------
                RUNNING: begin
                    if (start_pulse) begin
                        state <= PAUSED;
                    end else if (one_sec_tick) begin
                        if (time_left > 7'd1) begin
                            time_left <= time_left - 1'b1;
                        end else begin
                            time_left <= 7'd0;
                            state <= DONE;
                        end
                    end
                end

                // ---------------------------------------------
                // PAUSED: hold current time, allow adjustment
                // ---------------------------------------------
                PAUSED: begin
                    if (add_pulse) begin
                        if (time_left < MAX_TIME)
                            time_left <= time_left + 1'b1;
                    end else if (sub_pulse) begin
                        if (time_left > 7'd0)
                            time_left <= time_left - 1'b1;
                    end else if (start_pulse) begin
                        if (time_left > 7'd0)
                            state <= RUNNING;
                        else
                            state <= DONE;
                    end
                end

                // ---------------------------------------------
                // DONE: countdown finished
                // ---------------------------------------------
                DONE: begin
                    if (add_pulse) begin
                        if (time_left < MAX_TIME)
                            time_left <= time_left + 1'b1;
                        state <= IDLE;
                    end else if (start_pulse) begin
                        if (time_left > 7'd0)
                            state <= RUNNING;
                    end
                end

                default: begin
                    state <= IDLE;
                    time_left <= DEFAULT_TIME;
                end

            endcase
        end
    end


    // =========================================================
    // 5. Decimal digit conversion
    // =========================================================

    wire [3:0] tens;
    wire [3:0] ones;

    assign tens = time_left / 10;
    assign ones = time_left % 10;


    // =========================================================
    // 6. Seven-segment dynamic scan
    // =========================================================
    // The previous board test showed that displaying DEFAULT_TIME=10
    // appeared as "01". Therefore this version maps:
    //   COM1 -> tens
    //   COM2 -> ones
    //
    // If your board displays "01" again, swap tens and ones below.

    reg [15:0] scan_cnt = 16'd0;
    reg scan_sel = 1'b0;
    reg [3:0] current_digit = 4'd0;

    always @(posedge clk) begin
        // Toggle every 25,000 cycles:
        // 50 MHz / 25,000 = 2 kHz toggle rate
        // Two digits refreshed at about 1 kHz each
        if (scan_cnt == 16'd24_999) begin
            scan_cnt <= 16'd0;
            scan_sel <= ~scan_sel;
        end else begin
            scan_cnt <= scan_cnt + 1'b1;
        end
    end

    always @(*) begin
        case (scan_sel)
            1'b0: begin
                current_digit = tens;
                seg_sel = 4'b1110;     // COM1 enabled, show tens
            end

            1'b1: begin
                current_digit = ones;
                seg_sel = 4'b1101;     // COM2 enabled, show ones
            end

            default: begin
                current_digit = 4'd0;
                seg_sel = 4'b1111;     // all off
            end
        endcase
    end


    // =========================================================
    // 7. Seven-segment decoder
    // =========================================================

    seg7_decoder u_seg7_decoder (
        .digit(current_digit),
        .seg(seg_output)
    );

endmodule
