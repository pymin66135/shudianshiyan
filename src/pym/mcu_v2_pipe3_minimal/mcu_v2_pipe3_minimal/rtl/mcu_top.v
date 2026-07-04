//============================================================
// Module: mcu_top
// 
// 程序主要结构:
// 1. Stage 1 (IF): 取指阶段。包含 PC 寄存器、指令 ROM 实例化以及 IF/ID 流水线寄存器。
// 2. Stage 2 (ID/EX/MEM): 组合逻辑核心。指令解码 (control_unit)、寄存器堆读写仲裁与读取 (reg_file)、
//    操作数生成 (operand2_decode)、ALU 运算 (alu)、分支目标计算以及数据存储器 (data_mem) 访问。
// 3. Stage 3 (WB): 写回与状态提交阶段。利用 EX/WB 流水线寄存器的数据更新寄存器堆和架构标志位 (flags)。
// 4. Forwarding (数据旁路): 包含从 WB 阶段到 EX 阶段的数据旁路逻辑，解决 RAW 数据冒险，以及标志位旁路。
//
// 修改说明:
// - 针对时序报告中 `if_id_instr_reg` 扇出过高（Fanout=131）导致 6ns 以上布线延迟的问题，
//   在 IF/ID 流水线寄存器的关键信号上添加了 `(* max_fanout = "16" *)` 综合属性。
// - 强制 Vivado 复制这些高扇出寄存器，使其在物理布局上更靠近各自驱动的逻辑块（如 ALU、译码器、分支计算），
//   从而在不改变现有 3 级流水线架构的前提下大幅压缩 Net Delay。
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
    input  wire                                  ext_mem_mode,
    input  wire                                  ext_mem_we,
    input  wire [DATA_MEM_ADDR_WIDTH-1:0]        ext_mem_addr,
    input  wire [31:0]                           ext_mem_wdata,
    output wire [31:0]                           ext_mem_rdata,

    // Debug outputs for top-level ILA / simulation.
    // In V2 pipe3, these are commit/WB-stage views.
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

localparam CLASS_DP  = 2'b00;
localparam CLASS_MEM = 2'b01;
localparam CLASS_BR  = 2'b10;

//============================================================
// Stage 1: IF
//============================================================
wire [31:0] pc;
wire [31:0] pc_plus4_if;
wire [31:0] pc_plus8_if;
wire [31:0] instr_if;
wire [31:0] next_pc;

assign pc_plus4_if = pc + 32'd4;
assign pc_plus8_if = pc + 32'd8;

pc_reg u_pc_reg (
    .clk       (clk),
    .rst_n     (rst_n),
    .pc_enable (pc_enable),
    .next_pc   (next_pc),
    .pc        (pc)
);

instr_rom #(
    .ADDR_WIDTH    (INSTR_ROM_ADDR_WIDTH),
    .INIT_FILE     (PROGRAM_FILE),
    .USE_INIT_FILE (PROGRAM_FROM_FILE)
) u_instr_rom (
    .pc    (pc),
    .instr (instr_if)
);

// IF/ID pipeline register
// 加入 max_fanout 属性，强制降低扇出，优化布线延迟
(* max_fanout = "16" *) reg        if_id_valid;
reg [31:0] if_id_pc;
(* max_fanout = "16" *) reg [31:0] if_id_instr;
reg [31:0] if_id_pc_plus4;
reg [31:0] if_id_pc_plus8;

//============================================================
// Stage 2: ID/EX/MEM combinational logic
//============================================================
wire [31:0] instr_ex = if_id_instr;
wire [3:0]  cond_ex  = instr_ex[31:28];
wire [3:0]  rn_ex    = instr_ex[19:16];
wire [3:0]  rd_ex    = instr_ex[15:12];
wire [3:0]  rm_ex    = instr_ex[3:0];
wire [11:0] imm12_ex = instr_ex[11:0];

wire [1:0] instr_class_ex;
wire       raw_reg_write_ex;
wire       raw_mem_write_ex;
wire       mem_to_reg_ex;
wire       alu_src_imm_ex;
wire [3:0] alu_op_ex;
wire       branch_ex;
wire       link_ex;
wire       raw_flag_write_ex;
wire       unsupported_control_ex;
wire       unsupported_operand2_ex;
wire       unsupported_total_ex;

control_unit u_control_unit (
    .instr       (instr_ex),
    .instr_class (instr_class_ex),
    .reg_write   (raw_reg_write_ex),
    .mem_write   (raw_mem_write_ex),
    .mem_to_reg  (mem_to_reg_ex),
    .alu_src_imm (alu_src_imm_ex),
    .alu_op      (alu_op_ex),
    .branch      (branch_ex),
    .link        (link_ex),
    .flag_write  (raw_flag_write_ex),
    .unsupported (unsupported_control_ex)
);

wire is_mem_instr_ex = (instr_class_ex == CLASS_MEM);
wire is_str_instr_ex = is_mem_instr_ex && raw_mem_write_ex;

wire [3:0] ra1_ex;
wire [3:0] ra2_ex;
wire [3:0] wa_ex;
assign ra1_ex = rn_ex;
assign ra2_ex = is_str_instr_ex ? rd_ex : rm_ex;
assign wa_ex  = link_ex ? 4'd14 : rd_ex;

// Register file write-back is from Stage 3.
wire        wb_commit_we;
wire [3:0]  wb_commit_wa;
wire [31:0] wb_commit_wd;

wire [31:0] rd1_raw_ex;
wire [31:0] rd2_raw_ex;

reg_file u_reg_file (
    .clk       (clk),
    .rst_n     (rst_n),
    .pc_plus8  (if_id_pc_plus8),
    .ra1       (ra1_ex),
    .ra2       (ra2_ex),
    .wa        (wb_commit_wa),
    .wd        (wb_commit_wd),
    .we        (wb_commit_we),
    .rd1       (rd1_raw_ex),
    .rd2       (rd2_raw_ex),
    .debug_r0  (),
    .debug_r1  (),
    .debug_r2  (),
    .debug_r3  (),
    .debug_r15 ()
);

// EX/WB pipeline register, declared before forwarding use.
reg        ex_wb_valid;
reg [31:0] ex_wb_pc;
reg [31:0] ex_wb_instr;
reg [31:0] ex_wb_alu_result;
reg [31:0] ex_wb_mem_addr;
reg [31:0] ex_wb_mem_wdata;
reg        ex_wb_mem_write;
reg        ex_wb_reg_write;
reg [3:0]  ex_wb_reg_waddr;
reg [31:0] ex_wb_reg_wdata;
reg        ex_wb_flag_write;
reg [3:0]  ex_wb_flags;
reg        ex_wb_unsupported;

// Architectural flags register, updated in WB.
reg [3:0] flags;

// Forwarding from WB/commit register to current EX source operands.
wire wb_can_forward = ex_wb_valid && ex_wb_reg_write && (ex_wb_reg_waddr != 4'd15);

wire [31:0] rd1_fwd_ex;
wire [31:0] rd2_fwd_ex;
assign rd1_fwd_ex = (wb_can_forward && (ex_wb_reg_waddr == ra1_ex)) ? ex_wb_reg_wdata : rd1_raw_ex;
assign rd2_fwd_ex = (wb_can_forward && (ex_wb_reg_waddr == ra2_ex)) ? ex_wb_reg_wdata : rd2_raw_ex;

wire [31:0] decoded_operand2_ex;
operand2_decode u_operand2_decode (
    .instr       (instr_ex),
    .rm_value    (rd2_fwd_ex),
    .operand2    (decoded_operand2_ex),
    .unsupported (unsupported_operand2_ex)
);

wire [31:0] alu_b_ex;
assign alu_b_ex = is_mem_instr_ex ? {20'b0, imm12_ex} : decoded_operand2_ex;

wire [31:0] alu_result_ex;
wire [3:0]  alu_flags_out_ex;
alu u_alu (
    .a         (rd1_fwd_ex),
    .b         (alu_b_ex),
    .alu_op    (alu_op_ex),
    .result    (alu_result_ex),
    .flags_out (alu_flags_out_ex)
);

// Flags forwarding: SUBS immediately followed by Bxx/STRxx must see new flags.
wire [3:0] flags_for_cond_ex;
assign flags_for_cond_ex = (ex_wb_valid && ex_wb_flag_write) ? ex_wb_flags : flags;

wire cond_pass_ex;
cond_unit u_cond_unit (
    .cond      (cond_ex),
    .flags     (flags_for_cond_ex),
    .cond_pass (cond_pass_ex)
);

assign unsupported_total_ex = unsupported_control_ex | unsupported_operand2_ex;

wire effective_reg_write_ex;
wire effective_mem_write_ex;
wire effective_flag_write_ex;
assign effective_reg_write_ex  = if_id_valid & raw_reg_write_ex  & cond_pass_ex & ~unsupported_total_ex;
assign effective_mem_write_ex  = if_id_valid & raw_mem_write_ex  & cond_pass_ex & ~unsupported_total_ex;
assign effective_flag_write_ex = if_id_valid & raw_flag_write_ex & cond_pass_ex & ~unsupported_total_ex;

wire [31:0] mem_read_data_ex;

data_mem #(
    .ADDR_WIDTH(DATA_MEM_ADDR_WIDTH)
) u_data_mem (
    .clk        (clk),
    .addr       (alu_result_ex),
    .write_data (rd2_fwd_ex),
    .mem_write  (effective_mem_write_ex),
    .read_data  (mem_read_data_ex),

    .ext_mode   (ext_mem_mode),
    .ext_we     (ext_mem_we),
    .ext_addr   (ext_mem_addr),
    .ext_wdata  (ext_mem_wdata),
    .ext_rdata  (ext_mem_rdata)
);

wire [31:0] wb_data_ex;
assign wb_data_ex = link_ex       ? if_id_pc_plus4 :
                    mem_to_reg_ex ? mem_read_data_ex :
                                    alu_result_ex;

// Branch calculation follows the original branch_unit semantics:
// target = PC + 8 + sign_extend(imm24 << 2)
wire [31:0] branch_offset_ex;
wire [31:0] branch_target_ex;
wire        branch_taken_ex;
assign branch_offset_ex = {{6{instr_ex[23]}}, instr_ex[23:0], 2'b00};
assign branch_target_ex = if_id_pc_plus8 + branch_offset_ex;
assign branch_taken_ex  = if_id_valid & branch_ex & cond_pass_ex & ~unsupported_total_ex;

assign next_pc = branch_taken_ex ? branch_target_ex : pc_plus4_if;

//============================================================
// Stage 3: WB / commit
//============================================================
assign wb_commit_we = pc_enable & ex_wb_valid & ex_wb_reg_write;
assign wb_commit_wa = ex_wb_reg_waddr;
assign wb_commit_wd = ex_wb_reg_wdata;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        flags <= 4'b0000;
    end else if (pc_enable && ex_wb_valid && ex_wb_flag_write) begin
        flags <= ex_wb_flags;
    end
end

//============================================================
// Pipeline registers
//============================================================
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        if_id_valid    <= 1'b0;
        if_id_pc       <= 32'b0;
        if_id_instr    <= 32'hE1A00000; // ARM NOP: MOV R0,R0
        if_id_pc_plus4 <= 32'b0;
        if_id_pc_plus8 <= 32'b0;

        ex_wb_valid       <= 1'b0;
        ex_wb_pc          <= 32'b0;
        ex_wb_instr       <= 32'hE1A00000;
        ex_wb_alu_result  <= 32'b0;
        ex_wb_mem_addr    <= 32'b0;
        ex_wb_mem_wdata   <= 32'b0;
        ex_wb_mem_write   <= 1'b0;
        ex_wb_reg_write   <= 1'b0;
        ex_wb_reg_waddr   <= 4'b0;
        ex_wb_reg_wdata   <= 32'b0;
        ex_wb_flag_write  <= 1'b0;
        ex_wb_flags       <= 4'b0;
        ex_wb_unsupported <= 1'b0;
    end else if (pc_enable) begin
        // IF/ID update. A taken branch flushes the sequentially fetched instruction.
        if (branch_taken_ex) begin
            if_id_valid    <= 1'b0;
            if_id_pc       <= 32'b0;
            if_id_instr    <= 32'hE1A00000;
            if_id_pc_plus4 <= 32'b0;
            if_id_pc_plus8 <= 32'b0;
        end else begin
            if_id_valid    <= 1'b1;
            if_id_pc       <= pc;
            if_id_instr    <= instr_if;
            if_id_pc_plus4 <= pc_plus4_if;
            if_id_pc_plus8 <= pc_plus8_if;
        end

        // EX/WB update. Invalid bubbles become non-writing NOP-like commits.
        ex_wb_valid       <= if_id_valid;
        ex_wb_pc          <= if_id_pc;
        ex_wb_instr       <= if_id_instr;
        ex_wb_alu_result  <= alu_result_ex;
        ex_wb_mem_addr    <= alu_result_ex;
        ex_wb_mem_wdata   <= rd2_fwd_ex;
        ex_wb_mem_write   <= effective_mem_write_ex;
        ex_wb_reg_write   <= effective_reg_write_ex;
        ex_wb_reg_waddr   <= wa_ex;
        ex_wb_reg_wdata   <= wb_data_ex;
        ex_wb_flag_write  <= effective_flag_write_ex;
        ex_wb_flags       <= alu_flags_out_ex;
        ex_wb_unsupported <= if_id_valid & unsupported_total_ex;
    end
end

//============================================================
// Debug outputs: WB/commit-stage view.
//============================================================
assign debug_pc          = ex_wb_pc;
assign debug_instr       = ex_wb_instr;
assign debug_alu_result  = ex_wb_alu_result;
assign debug_mem_wdata   = ex_wb_mem_wdata;
assign debug_mem_addr    = ex_wb_mem_addr;
assign debug_reg_wdata   = ex_wb_reg_wdata;
assign debug_reg_waddr   = ex_wb_reg_waddr;
assign debug_reg_write   = pc_enable & ex_wb_valid & ex_wb_reg_write;
assign debug_mem_write   = pc_enable & ex_wb_valid & ex_wb_mem_write;
assign debug_flags       = flags;
assign debug_unsupported = ex_wb_valid & ex_wb_unsupported;

endmodule // mcu_top