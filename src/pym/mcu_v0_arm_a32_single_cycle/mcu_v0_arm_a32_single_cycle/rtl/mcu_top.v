//============================================================
// Module: mcu_top
// Description:
//   Top-level module of V0 ARM A32 subset single-cycle MCU.
//   Simulation-only version.
//
// Parameters:
//   PROGRAM_FILE          : optional hex file loaded by instr_rom
//   PROGRAM_FROM_FILE     : 1 to load PROGRAM_FILE, 0 to use built-in program
//   INSTR_ROM_ADDR_WIDTH  : instruction ROM word address width
//   DATA_MEM_ADDR_WIDTH   : data memory word address width
//
// Inputs:
//   clk              : system clock
//   rst_n            : active-low reset
//
// Outputs:
//   debug_pc         : current PC value
//   debug_instr      : current instruction
//   debug_alu_result : ALU result of current instruction
//   debug_mem_wdata  : data written to data memory
//   debug_mem_addr   : data memory byte address
//   debug_reg_wdata  : data written back to register file
//   debug_reg_waddr  : register write address
//   debug_reg_write  : effective register write enable
//   debug_mem_write  : effective memory write enable
//   debug_flags      : current NZCV flags
//   debug_unsupported: high when instruction is unsupported in V0
//============================================================

`timescale 1ns/1ps

module mcu_top #(
    parameter PROGRAM_FILE         = "program.hex",
    parameter PROGRAM_FROM_FILE    = 0,
    parameter INSTR_ROM_ADDR_WIDTH = 8,
    parameter DATA_MEM_ADDR_WIDTH  = 8
)(
    input  wire        clk,
    input  wire        rst_n,

    output wire [31:0] debug_pc,
    output wire [31:0] debug_instr,
    output wire [31:0] debug_alu_result,
    output wire [31:0] debug_mem_wdata,
    output wire [31:0] debug_mem_addr,
    output wire [31:0] debug_reg_wdata,
    output wire [3:0]  debug_reg_waddr,
    output wire        debug_reg_write,
    output wire        debug_mem_write,
    output wire [3:0]  debug_flags,
    output wire        debug_unsupported
);

localparam CLASS_DP  = 2'b00;
localparam CLASS_MEM = 2'b01;
localparam CLASS_BR  = 2'b10;

wire [31:0] pc;
wire [31:0] next_pc;
wire [31:0] pc_plus4;
wire [31:0] branch_target;
wire [31:0] instr;

wire [3:0] cond   = instr[31:28];
wire [3:0] rn     = instr[19:16];
wire [3:0] rd     = instr[15:12];
wire [3:0] rm     = instr[3:0];
wire [11:0] imm12 = instr[11:0];

wire [1:0] instr_class;
wire raw_reg_write;
wire raw_mem_write;
wire mem_to_reg;
wire alu_src_imm;
wire [3:0] alu_op;
wire branch;
wire link;
wire raw_flag_write;
wire unsupported_control;
wire unsupported_operand2;
wire unsupported_total;

reg [3:0] flags;
wire cond_pass;

wire [3:0] ra1;
wire [3:0] ra2;
wire [3:0] wa;
wire [31:0] rd1;
wire [31:0] rd2;
wire [31:0] wb_data;
wire effective_reg_write;
wire effective_mem_write;
wire effective_flag_write;

wire [31:0] decoded_operand2;
wire [31:0] alu_b;
wire [31:0] alu_result;
wire [3:0] alu_flags_out;
wire [31:0] mem_read_data;

wire is_mem_instr = (instr_class == CLASS_MEM);
wire is_str_instr = is_mem_instr && raw_mem_write;

pc_reg u_pc_reg (
    .clk     (clk),
    .rst_n   (rst_n),
    .next_pc (next_pc),
    .pc      (pc)
);

instr_rom #(
    .ADDR_WIDTH    (INSTR_ROM_ADDR_WIDTH),
    .INIT_FILE     (PROGRAM_FILE),
    .USE_INIT_FILE (PROGRAM_FROM_FILE)
) u_instr_rom (
    .pc    (pc),
    .instr (instr)
);

control_unit u_control_unit (
    .instr       (instr),
    .instr_class (instr_class),
    .reg_write   (raw_reg_write),
    .mem_write   (raw_mem_write),
    .mem_to_reg  (mem_to_reg),
    .alu_src_imm (alu_src_imm),
    .alu_op      (alu_op),
    .branch      (branch),
    .link        (link),
    .flag_write  (raw_flag_write),
    .unsupported (unsupported_control)
);

cond_unit u_cond_unit (
    .cond      (cond),
    .flags     (flags),
    .cond_pass (cond_pass)
);

assign ra1 = rn;
assign ra2 = is_str_instr ? rd : rm;
assign wa  = link ? 4'd14 : rd;

reg_file u_reg_file (
    .clk      (clk),
    .rst_n    (rst_n),
    .ra1      (ra1),
    .ra2      (ra2),
    .wa       (wa),
    .wd       (wb_data),
    .we       (effective_reg_write),
    .rd1      (rd1),
    .rd2      (rd2),
    .debug_r0 (),
    .debug_r1 (),
    .debug_r2 (),
    .debug_r3 ()
);

operand2_decode u_operand2_decode (
    .instr       (instr),
    .rm_value    (rd2),
    .operand2    (decoded_operand2),
    .unsupported (unsupported_operand2)
);

assign alu_b = is_mem_instr ? {20'b0, imm12} : decoded_operand2;

alu u_alu (
    .a         (rd1),
    .b         (alu_b),
    .alu_op    (alu_op),
    .result    (alu_result),
    .flags_out (alu_flags_out)
);

data_mem #(
    .ADDR_WIDTH(DATA_MEM_ADDR_WIDTH)
) u_data_mem (
    .clk        (clk),
    .addr       (alu_result),
    .write_data (rd2),
    .mem_write  (effective_mem_write),
    .read_data  (mem_read_data)
);

branch_unit u_branch_unit (
    .pc            (pc),
    .instr         (instr),
    .branch        (branch),
    .cond_pass     (cond_pass),
    .pc_plus4      (pc_plus4),
    .branch_target (branch_target),
    .next_pc       (next_pc)
);

assign unsupported_total = unsupported_control | unsupported_operand2;

assign effective_reg_write  = raw_reg_write  & cond_pass & ~unsupported_total;
assign effective_mem_write  = raw_mem_write  & cond_pass & ~unsupported_total;
assign effective_flag_write = raw_flag_write & cond_pass & ~unsupported_total;

assign wb_data = link       ? pc_plus4 :
                 mem_to_reg ? mem_read_data :
                              alu_result;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        flags <= 4'b0000;
    end else begin
        if (effective_flag_write) begin
            flags <= alu_flags_out;
        end
    end
end

assign debug_pc          = pc;
assign debug_instr       = instr;
assign debug_alu_result  = alu_result;
assign debug_mem_wdata   = rd2;
assign debug_mem_addr    = alu_result;
assign debug_reg_wdata   = wb_data;
assign debug_reg_waddr   = wa;
assign debug_reg_write   = effective_reg_write;
assign debug_mem_write   = effective_mem_write;
assign debug_flags       = flags;
assign debug_unsupported = unsupported_total;

endmodule // mcu_top
