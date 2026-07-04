//============================================================
// Module: control_unit (V3.5)
// Description:
//   Decode ARM A32 subset for sorting-network cores.
//   V3.5: BRANCH / LINK logic REMOVED — PC always increments by 4.
//         Only DP (data-processing) and MEM (LDR/STR) are supported.
//
//   Branch instructions (B/BL) are decoded as unsupported.
//============================================================

`timescale 1ns/1ps

module control_unit (
    input  wire [31:0] instr,

    output reg  [1:0]  instr_class,
    output reg         reg_write,
    output reg         mem_write,
    output reg         mem_to_reg,
    output reg         alu_src_imm,
    output reg  [3:0]  alu_op,
    output reg         flag_write,
    output reg         unsupported
);

localparam CLASS_DP  = 2'b00;
localparam CLASS_MEM = 2'b01;
localparam CLASS_INV = 2'b11;

localparam ALU_AND = 4'b0000;
localparam ALU_SUB = 4'b0010;
localparam ALU_ADD = 4'b0100;
localparam ALU_ORR = 4'b1100;
localparam ALU_MOV = 4'b1101;
localparam OP_CMP  = 4'b1010;

wire [1:0] op27_26 = instr[27:26];
wire [2:0] op27_25 = instr[27:25];
wire       bit25   = instr[25];
wire [3:0] opcode  = instr[24:21];
wire       s_bit   = instr[20];

wire mem_I = instr[25];
wire mem_P = instr[24];
wire mem_U = instr[23];
wire mem_B = instr[22];
wire mem_W = instr[21];
wire mem_L = instr[20];

always @(*) begin
    instr_class = CLASS_INV;
    reg_write   = 1'b0;
    mem_write   = 1'b0;
    mem_to_reg  = 1'b0;
    alu_src_imm = 1'b0;
    alu_op      = ALU_ADD;
    flag_write  = 1'b0;
    unsupported = 1'b1;

    if (op27_25 == 3'b101) begin
        // B / BL — unsupported in V3.5 (no branching in sorting network)
        instr_class = CLASS_INV;
        reg_write   = 1'b0;
        mem_write   = 1'b0;
        mem_to_reg  = 1'b0;
        alu_src_imm = 1'b0;
        alu_op      = ALU_ADD;
        flag_write  = 1'b0;
        unsupported = 1'b1;
    end else if (op27_26 == 2'b00) begin
        // Data-processing subset
        instr_class = CLASS_DP;
        reg_write   = 1'b1;
        mem_write   = 1'b0;
        mem_to_reg  = 1'b0;
        alu_src_imm = bit25;
        flag_write  = s_bit;

        case (opcode)
            ALU_AND: begin alu_op = ALU_AND; unsupported = 1'b0; end
            ALU_SUB: begin alu_op = ALU_SUB; unsupported = 1'b0; end
            ALU_ADD: begin alu_op = ALU_ADD; unsupported = 1'b0; end
            OP_CMP: begin
                alu_op      = ALU_SUB;
                reg_write   = 1'b0;
                flag_write  = 1'b1;
                unsupported = 1'b0;
            end
            ALU_ORR: begin alu_op = ALU_ORR; unsupported = 1'b0; end
            ALU_MOV: begin alu_op = ALU_MOV; unsupported = 1'b0; end
            default: begin alu_op = ALU_ADD; unsupported = 1'b1; end
        endcase
    end else if (op27_26 == 2'b01) begin
        // Single data transfer: LDR/STR Rd, [Rn, #imm12]
        // V3.5: these access the global register file instead of data_mem.
        instr_class = CLASS_MEM;
        alu_op      = ALU_ADD;
        alu_src_imm = 1'b1;
        flag_write  = 1'b0;

        if ((mem_I == 1'b0) && (mem_P == 1'b1) && (mem_U == 1'b1) &&
            (mem_B == 1'b0) && (mem_W == 1'b0)) begin
            if (mem_L == 1'b1) begin
                // LDR → read from global_rf
                reg_write  = 1'b1;
                mem_write  = 1'b0;
                mem_to_reg = 1'b1;
            end else begin
                // STR → write to global_rf
                reg_write  = 1'b0;
                mem_write  = 1'b1;
                mem_to_reg = 1'b0;
            end
            unsupported = 1'b0;
        end else begin
            reg_write   = 1'b0;
            mem_write   = 1'b0;
            mem_to_reg  = 1'b0;
            unsupported = 1'b1;
        end
    end else begin
        instr_class = CLASS_INV;
        unsupported = 1'b1;
    end
end

endmodule // control_unit
