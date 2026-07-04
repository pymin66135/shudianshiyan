//============================================================
// Module: mcu_top
// Description:
//   V2_pipe3 ARM A32 subset 3-stage pipelined MCU core.
//
// Baseline:
//   Derived from P4_sort_opt_pipe3 three-stage pipeline MCU.
//
// Design rule for this first pipe3 version:
//   - Keep top.v/test_ROM/verify_RAM/cnt_test/ILA interface unchanged.
//   - Keep the original Shell sort instr_rom.v and DONE_PC=0x168 unchanged.
//   - Change only the MCU microarchitecture inside this module.
//
// Pipeline stages:
//   Stage 1: IF
//     PC register + instr_rom fetch.  The fetched instruction is latched into
//     IF/ID together with its PC and a valid bit.
//
//   Stage 2: ID/EX
//     Decode, condition check, register read, operand2 decode, ALU/address
//     calculation, branch decision.  Results and effective control signals are
//     latched into EX/WB.
//
//   Stage 3: MEM/WB / commit
//     data_mem read/write, register write-back, flags update, debug outputs.
//
// Hazard handling in this first version:
//   - WB forwarding from EX/WB to the current ID/EX operands.
//   - Flags forwarding from EX/WB to condition check, so SUBS -> Bxx works.
//   - Branch taken flushes IF/ID and redirects PC to branch_target.
//   - valid bits prevent flushed/bubble instructions from writing RF/RAM/flags.
//
// Notes:
//   debug_pc/debug_instr are commit-stage signals.  This is critical because
//   top.v uses debug_pc == DONE_PC to leave ST_RUN and write verify_RAM.
//============================================================

`timescale 1ns/1ps

module mcu_top #(
    parameter PROGRAM_FILE         = "sort64_signed.hex",
    parameter PROGRAM_FROM_FILE    = 0,
    parameter INSTR_ROM_ADDR_WIDTH = 8,
    parameter DATA_MEM_ADDR_WIDTH  = 8
)(
    input  wire        clk,
    input  wire        rst,
    input  wire        pc_enable,

    // External top.v access to internal data memory
    input  wire                           ext_mem_mode,
    input  wire                           ext_mem_we,
    input  wire [DATA_MEM_ADDR_WIDTH-1:0] ext_mem_addr,
    input  wire [31:0]                    ext_mem_wdata,
    output wire [31:0]                    ext_mem_rdata,

    // Debug outputs for top-level ILA / simulation
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

wire rst_n = ~rst;

localparam CLASS_MEM = 2'b01;
localparam NOP_INSTR = 32'hE1A00000; // MOV R0,R0, treated as harmless bubble if valid=0.

//============================================================
// Stage 1: IF
//============================================================
wire [31:0] pc;
wire [31:0] if_instr;
wire [31:0] pc_plus4_if;
wire [31:0] pc_next;
wire        pc_update_enable;

// IF/ID pipeline register
reg        if_id_valid;
reg [31:0] if_id_pc;
reg [31:0] if_id_instr;

assign pc_plus4_if = pc + 32'd4;
assign pc_update_enable = pc_enable;

pc_reg u_pc_reg (
    .clk       (clk),
    .rst_n     (rst_n),
    .pc_enable (pc_update_enable),
    .next_pc   (pc_next),
    .pc        (pc)
);

instr_rom #(
    .ADDR_WIDTH    (INSTR_ROM_ADDR_WIDTH),
    .INIT_FILE     (PROGRAM_FILE),
    .USE_INIT_FILE (PROGRAM_FROM_FILE)
) u_instr_rom (
    .pc    (pc),
    .instr (if_instr)
);

//============================================================
// Stage 2: ID/EX combinational decode/execute
//============================================================
wire [31:0] id_instr = if_id_valid ? if_id_instr : NOP_INSTR;
wire [31:0] id_pc    = if_id_pc;

wire [3:0]  id_cond   = id_instr[31:28];
wire [3:0]  id_rn     = id_instr[19:16];
wire [3:0]  id_rd     = id_instr[15:12];
wire [3:0]  id_rm     = id_instr[3:0];
wire [11:0] id_imm12  = id_instr[11:0];

wire [1:0]  id_instr_class;
wire        id_raw_reg_write;
wire        id_raw_mem_write;
wire        id_mem_to_reg;
wire        id_alu_src_imm;
wire [3:0]  id_alu_op;
wire        id_branch;
wire        id_link;
wire        id_raw_flag_write;
wire        id_unsupported_control;
wire        id_unsupported_operand2;
wire        id_unsupported_total;

wire        id_is_mem_instr;
wire        id_is_str_instr;
wire [3:0]  id_ra1;
wire [3:0]  id_ra2;
wire [3:0]  id_wa;

wire [31:0] rf_rd1_raw;
wire [31:0] rf_rd2_raw;
wire [31:0] id_pc_plus4;
wire [31:0] id_pc_plus8;
wire [31:0] id_branch_target;
wire [31:0] id_next_pc_unused;

wire        flag_forward_valid;
wire [3:0]  flags_forwarded;
wire        id_cond_pass;
wire [31:0] wb_data;
wire        ex_wb_effective_reg_write;

wire [31:0] id_rd1_forwarded;
wire [31:0] id_rd2_forwarded;
wire [31:0] id_decoded_operand2;
wire [31:0] id_alu_b;
wire [31:0] id_alu_result;
wire [3:0]  id_alu_flags_out;
wire        id_effective_reg_write;
wire        id_effective_mem_write;
wire        id_effective_flag_write;
wire        id_branch_taken;


//============================================================
// Stage 3 pipeline register declarations are placed here because
// Stage 2 forwarding logic reads the current EX/WB contents.
//============================================================
reg        ex_wb_valid;
reg [31:0] ex_wb_pc;
reg [31:0] ex_wb_instr;
reg        ex_wb_reg_write;
reg        ex_wb_mem_write;
reg        ex_wb_mem_to_reg;
reg        ex_wb_flag_write;
reg        ex_wb_link;
reg [3:0]  ex_wb_wa;
reg [31:0] ex_wb_alu_result;
reg [31:0] ex_wb_store_data;
reg [31:0] ex_wb_pc_plus4;
reg [3:0]  ex_wb_flags_out;
reg        ex_wb_unsupported;

// Global committed flags, flags[3]=N, flags[2]=Z, flags[1]=C, flags[0]=V.
reg [3:0] flags;

control_unit u_control_unit (
    .instr       (id_instr),
    .instr_class (id_instr_class),
    .reg_write   (id_raw_reg_write),
    .mem_write   (id_raw_mem_write),
    .mem_to_reg  (id_mem_to_reg),
    .alu_src_imm (id_alu_src_imm),
    .alu_op      (id_alu_op),
    .branch      (id_branch),
    .link        (id_link),
    .flag_write  (id_raw_flag_write),
    .unsupported (id_unsupported_control)
);

assign id_is_mem_instr = (id_instr_class == CLASS_MEM);
assign id_is_str_instr = id_is_mem_instr && id_raw_mem_write;
assign id_ra1 = id_rn;
assign id_ra2 = id_is_str_instr ? id_rd : id_rm;
assign id_wa  = id_link ? 4'd14 : id_rd;
assign id_pc_plus8 = id_pc + 32'd8;

reg_file u_reg_file (
    .clk       (clk),
    .rst_n     (rst_n),
    .pc_plus8  (id_pc_plus8),
    .ra1       (id_ra1),
    .ra2       (id_ra2),
    .wa        (ex_wb_wa),
    .wd        (wb_data),
    .we        (ex_wb_effective_reg_write),
    .rd1       (rf_rd1_raw),
    .rd2       (rf_rd2_raw),
    .debug_r0  (),
    .debug_r1  (),
    .debug_r2  (),
    .debug_r3  (),
    .debug_r15 ()
);

// EX/WB -> ID/EX forwarding.  One-cycle dependencies are common in the
// current Shell sort program, for example LDR R5; SUBS R6,R5,R3.
assign ex_wb_effective_reg_write = ex_wb_valid && ex_wb_reg_write;

assign id_rd1_forwarded = (ex_wb_effective_reg_write && (ex_wb_wa == id_ra1)) ? wb_data : rf_rd1_raw;
assign id_rd2_forwarded = (ex_wb_effective_reg_write && (ex_wb_wa == id_ra2)) ? wb_data : rf_rd2_raw;

operand2_decode u_operand2_decode (
    .instr       (id_instr),
    .rm_value    (id_rd2_forwarded),
    .operand2    (id_decoded_operand2),
    .unsupported (id_unsupported_operand2)
);

assign id_alu_b = id_is_mem_instr ? {20'b0, id_imm12} : id_decoded_operand2;

alu u_alu (
    .a         (id_rd1_forwarded),
    .b         (id_alu_b),
    .alu_op    (id_alu_op),
    .result    (id_alu_result),
    .flags_out (id_alu_flags_out)
);

// Forward the newest flags for immediate SUBS/CMP -> Bxx/STRxx patterns.
assign flag_forward_valid = ex_wb_valid && ex_wb_flag_write;
assign flags_forwarded    = flag_forward_valid ? ex_wb_flags_out : flags;

cond_unit u_cond_unit (
    .cond      (id_cond),
    .flags     (flags_forwarded),
    .cond_pass (id_cond_pass)
);

branch_unit u_branch_unit (
    .pc            (id_pc),
    .instr         (id_instr),
    .branch        (id_branch),
    .cond_pass     (id_cond_pass),
    .pc_plus4      (id_pc_plus4),
    .branch_target (id_branch_target),
    .next_pc       (id_next_pc_unused)
);

assign id_unsupported_total = id_unsupported_control | id_unsupported_operand2;
assign id_effective_reg_write  = if_id_valid && id_raw_reg_write  && id_cond_pass && !id_unsupported_total;
assign id_effective_mem_write  = if_id_valid && id_raw_mem_write  && id_cond_pass && !id_unsupported_total;
assign id_effective_flag_write = if_id_valid && id_raw_flag_write && id_cond_pass && !id_unsupported_total;
assign id_branch_taken = if_id_valid && id_branch && id_cond_pass && !id_unsupported_total;

assign pc_next = id_branch_taken ? id_branch_target : pc_plus4_if;

//============================================================
// Stage 3: MEM/WB commit
//============================================================
wire [31:0] mem_read_data;

data_mem #(
    .ADDR_WIDTH(DATA_MEM_ADDR_WIDTH)
) u_data_mem (
    .clk        (clk),
    .addr       (ex_wb_alu_result),
    .write_data (ex_wb_store_data),
    .mem_write  (ex_wb_valid && ex_wb_mem_write),
    .read_data  (mem_read_data),

    .ext_mode   (ext_mem_mode),
    .ext_we     (ext_mem_we),
    .ext_addr   (ext_mem_addr),
    .ext_wdata  (ext_mem_wdata),
    .ext_rdata  (ext_mem_rdata)
);

assign wb_data = ex_wb_link       ? ex_wb_pc_plus4 :
                 ex_wb_mem_to_reg ? mem_read_data  :
                                    ex_wb_alu_result;

// Pipeline registers and committed flags.
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        if_id_valid       <= 1'b0;
        if_id_pc          <= 32'b0;
        if_id_instr       <= NOP_INSTR;

        ex_wb_valid       <= 1'b0;
        ex_wb_pc          <= 32'b0;
        ex_wb_instr       <= NOP_INSTR;
        ex_wb_reg_write   <= 1'b0;
        ex_wb_mem_write   <= 1'b0;
        ex_wb_mem_to_reg  <= 1'b0;
        ex_wb_flag_write  <= 1'b0;
        ex_wb_link        <= 1'b0;
        ex_wb_wa          <= 4'b0;
        ex_wb_alu_result  <= 32'b0;
        ex_wb_store_data  <= 32'b0;
        ex_wb_pc_plus4    <= 32'b0;
        ex_wb_flags_out   <= 4'b0;
        ex_wb_unsupported <= 1'b0;
        flags             <= 4'b0000;
    end else if (!pc_enable) begin
        // Outside ST_RUN, do not leave stale valid instructions in the pipe.
        if_id_valid       <= 1'b0;
        if_id_pc          <= 32'b0;
        if_id_instr       <= NOP_INSTR;

        ex_wb_valid       <= 1'b0;
        ex_wb_pc          <= 32'b0;
        ex_wb_instr       <= NOP_INSTR;
        ex_wb_reg_write   <= 1'b0;
        ex_wb_mem_write   <= 1'b0;
        ex_wb_mem_to_reg  <= 1'b0;
        ex_wb_flag_write  <= 1'b0;
        ex_wb_link        <= 1'b0;
        ex_wb_wa          <= 4'b0;
        ex_wb_alu_result  <= 32'b0;
        ex_wb_store_data  <= 32'b0;
        ex_wb_pc_plus4    <= 32'b0;
        ex_wb_flags_out   <= 4'b0;
        ex_wb_unsupported <= 1'b0;
    end else begin
        // Commit flags from the instruction currently in MEM/WB.
        if (ex_wb_valid && ex_wb_flag_write) begin
            flags <= ex_wb_flags_out;
        end

        // IF/ID update.  A taken branch kills the sequentially fetched instruction.
        if (id_branch_taken) begin
            if_id_valid <= 1'b0;
            if_id_pc    <= 32'b0;
            if_id_instr <= NOP_INSTR;
        end else begin
            if_id_valid <= 1'b1;
            if_id_pc    <= pc;
            if_id_instr <= if_instr;
        end

        // ID/EX -> MEM/WB update.  Even taken branches are allowed to commit
        // here, because BL may write LR.  Non-link B simply has no side effects.
        ex_wb_valid       <= if_id_valid;
        ex_wb_pc          <= id_pc;
        ex_wb_instr       <= id_instr;
        ex_wb_reg_write   <= id_effective_reg_write;
        ex_wb_mem_write   <= id_effective_mem_write;
        ex_wb_mem_to_reg  <= id_mem_to_reg;
        ex_wb_flag_write  <= id_effective_flag_write;
        ex_wb_link        <= id_link && id_cond_pass && !id_unsupported_total && if_id_valid;
        ex_wb_wa          <= id_wa;
        ex_wb_alu_result  <= id_alu_result;
        ex_wb_store_data  <= id_rd2_forwarded;
        ex_wb_pc_plus4    <= id_pc_plus4;
        ex_wb_flags_out   <= id_alu_flags_out;
        ex_wb_unsupported <= id_unsupported_total && if_id_valid;
    end
end

//============================================================
// Commit-stage debug outputs
//============================================================
assign debug_pc          = ex_wb_valid ? ex_wb_pc         : 32'b0;
assign debug_instr       = ex_wb_valid ? ex_wb_instr      : NOP_INSTR;
assign debug_alu_result  = ex_wb_valid ? ex_wb_alu_result : 32'b0;
assign debug_mem_wdata   = ex_wb_valid ? ex_wb_store_data : 32'b0;
assign debug_mem_addr    = ex_wb_valid ? ex_wb_alu_result : 32'b0;
assign debug_reg_wdata   = (ex_wb_valid && ex_wb_reg_write) ? wb_data : 32'b0;
assign debug_reg_waddr   = ex_wb_wa;
assign debug_reg_write   = ex_wb_valid && ex_wb_reg_write;
assign debug_mem_write   = ex_wb_valid && ex_wb_mem_write;
assign debug_flags       = flags;
assign debug_unsupported = ex_wb_valid && ex_wb_unsupported;

endmodule // mcu_top
