//============================================================
// Module: branch_unit
// Description:
//   Compute next PC for sequential and branch instructions.
//
// Inputs:
//   pc        : current PC
//   instr     : current instruction
//   branch    : high for B/BL
//   cond_pass : high when condition is satisfied
//
// Outputs:
//   pc_plus4      : pc + 4
//   branch_target : pc + 8 + sign_extend(imm24 << 2)
//   next_pc       : selected next PC
//============================================================

`timescale 1ns/1ps

module branch_unit (
    input  wire [31:0] pc,
    input  wire [31:0] instr,
    input  wire        branch,
    input  wire        cond_pass,
    output wire [31:0] pc_plus4,
    output wire [31:0] branch_target,
    output wire [31:0] next_pc
);

wire [31:0] pc_plus8;
wire [31:0] branch_offset;

assign pc_plus4 = pc + 32'd4;
assign pc_plus8 = pc + 32'd8;

// imm24 is shifted left by 2 and then sign-extended to 32 bits.
assign branch_offset = {{6{instr[23]}}, instr[23:0], 2'b00};
assign branch_target = pc_plus8 + branch_offset;
assign next_pc = (branch && cond_pass) ? branch_target : pc_plus4;

endmodule // branch_unit
