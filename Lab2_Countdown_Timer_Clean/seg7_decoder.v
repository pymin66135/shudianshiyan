`timescale 1ns / 1ps
// ============================================================
// File: seg7_decoder.v
// Function:
//   Convert a decimal digit 0~9 to seven-segment code.
//
// Board convention used here:
//   seg[0] = A
//   seg[1] = B
//   seg[2] = C
//   seg[3] = D
//   seg[4] = E
//   seg[5] = F
//   seg[6] = G
//   seg[7] = DP
//
// Common cathode:
//   1 = segment ON
//   0 = segment OFF
// ============================================================

module seg7_decoder(
    input  wire [3:0] digit,
    output reg  [7:0] seg
);

    always @(*) begin
        case (digit)
            4'd0: seg = 8'b0011_1111; // 0
            4'd1: seg = 8'b0000_0110; // 1
            4'd2: seg = 8'b0101_1011; // 2
            4'd3: seg = 8'b0100_1111; // 3
            4'd4: seg = 8'b0110_0110; // 4
            4'd5: seg = 8'b0110_1101; // 5
            4'd6: seg = 8'b0111_1101; // 6
            4'd7: seg = 8'b0000_0111; // 7
            4'd8: seg = 8'b0111_1111; // 8
            4'd9: seg = 8'b0110_1111; // 9
            default: seg = 8'b0000_0000; // blank
        endcase
    end

endmodule
