//============================================================
// Module: cond_unit (V3.5 — unchanged from V2/V3)
// Description:
//   ARM condition code checker.
//   V3.5: unchanged. Still needed for conditional STR instructions
//         in the sorting network (e.g. STRcc).
//============================================================

`timescale 1ns/1ps

module cond_unit (
    input  wire [3:0] cond,
    input  wire [3:0] flags,
    output reg        cond_pass
);

wire n = flags[3];
wire z = flags[2];
wire c = flags[1];
wire v = flags[0];

always @(*) begin
    case (cond)
        4'b0000: cond_pass = z;                  // EQ
        4'b0001: cond_pass = ~z;                 // NE
        4'b0010: cond_pass = c;                  // CS/HS
        4'b0011: cond_pass = ~c;                 // CC/LO
        4'b0100: cond_pass = n;                  // MI
        4'b0101: cond_pass = ~n;                 // PL
        4'b0110: cond_pass = v;                  // VS
        4'b0111: cond_pass = ~v;                 // VC
        4'b1000: cond_pass = c & ~z;             // HI
        4'b1001: cond_pass = ~c | z;             // LS
        4'b1010: cond_pass = (n == v);           // GE
        4'b1011: cond_pass = (n != v);           // LT
        4'b1100: cond_pass = (~z) & (n == v);    // GT
        4'b1101: cond_pass = z | (n != v);       // LE
        4'b1110: cond_pass = 1'b1;               // AL
        default: cond_pass = 1'b0;
    endcase
end

endmodule // cond_unit
