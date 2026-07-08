//============================================================
// Module: mcu_top (V3.5 - Bugfixed)
// Description:
//   V3.5 single core for quad-core sorting architecture.
//
// ?????? (Bugfix ??):
//   - ????? core_done ??????????????????
//   - ?? core_done_reg ?????? debug_pc ?? DONE_PC?
//     ????????????????? ST_RUN?
//   - ?? internal_pc_enable?? core_done_reg ????????
//     ??? PC ?????????? PC ???45956 ??????
//
// Pipeline stages:
//   Stage 1 (IF):    PC reg ? embedded instr_rom ? IF/ID latch
//   Stage 2 (ID/EX): decode, reg_file read + forwarding, operand2,
//                    ALU, cond_unit, global_rf read address generation
//   Stage 3 (MEM/WB): global_rf write commit, reg_file write-back,
//                    flags update, debug outputs
//============================================================

`timescale 1ns/1ps

module mcu_top #(
    parameter CORE_ID            = 0,
    parameter INSTR_ROM_ADDR_WIDTH = 10,
    parameter PROGRAM_FILE         = "../programs/core_0.hex",
    parameter DONE_PC              = 32'h00000000
)(
    input  wire        clk,
    input  wire        rst,
    input  wire        pc_enable,

    // ---- Global register file access ----
    output wire [5:0]  gprf_raddr,
    input  wire [15:0] gprf_rdata,
    output wire [5:0]  gprf_waddr,
    output wire [15:0] gprf_wdata,
    output wire        gprf_we,

    // ---- Debug outputs (commit-stage view) ----
    output wire [31:0] debug_pc,
    output wire [31:0] debug_instr,
    output wire [31:0] debug_alu_result,
    output wire [31:0] debug_mem_wdata,
    output wire [5:0]  debug_mem_addr,
    output wire [31:0] debug_reg_wdata,
    output wire [3:0]  debug_reg_waddr,
    output wire        debug_reg_write,
    output wire        debug_mem_write,
    output wire [3:0]  debug_flags,
    output wire        debug_unsupported,
    output wire        core_done
);

wire rst_n = ~rst;

localparam CLASS_DP  = 2'b00;
localparam CLASS_MEM = 2'b01;
localparam NOP_INSTR = 32'hE1A00000;   // MOV R0,R0 (harmless bubble)

//============================================================
// [BUGFIX] ?????????????
//============================================================
reg core_done_reg;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        core_done_reg <= 1'b0;
    end else if (!pc_enable) begin
        // ??????? ST_RUN ????????
        core_done_reg <= 1'b0;
    end else if (debug_pc[31:2] == DONE_PC[31:2]) begin
        // ????? WB ??? PC ?????????? 1
        core_done_reg <= 1'b1;
    end
end

assign core_done = core_done_reg;

// ?? PC ????????????????????????
wire internal_pc_enable;
assign internal_pc_enable = pc_enable && !core_done_reg;

//============================================================
// Stage 1: IF - PC + Embedded Instruction ROM
//============================================================
wire [31:0] pc;
wire [31:0] pc_plus4_if;
wire [31:0] pc_next;

assign pc_plus4_if = pc + 32'd4;
// V3.5: NO branching - PC always increments by 4.
assign pc_next = pc_plus4_if;

pc_reg u_pc_reg (
    .clk       (clk),
    .rst_n     (rst_n),
    .pc_enable (internal_pc_enable), // ????????
    .next_pc   (pc_next),
    .pc        (pc)
);

//============================================================
// Embedded instruction ROM
//============================================================
localparam ROM_DEPTH = (1 << INSTR_ROM_ADDR_WIDTH);

reg [31:0] rom [0:ROM_DEPTH-1];
integer rom_init_idx;

wire [INSTR_ROM_ADDR_WIDTH-1:0] rom_addr;
assign rom_addr = pc[INSTR_ROM_ADDR_WIDTH+1:2];

wire [31:0] if_instr;
assign if_instr = rom[rom_addr];

//============================================================
// IF/ID pipeline register
//============================================================
reg        if_id_valid;
reg [31:0] if_id_pc;
reg [31:0] if_id_instr;

//============================================================
// Stage 2: ID/EX combinational logic
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

wire [31:0] id_rd1_forwarded;
wire [31:0] id_rd2_forwarded;
wire [31:0] id_decoded_operand2;
wire [31:0] id_alu_b;
wire [31:0] id_alu_result;
wire [3:0]  id_alu_flags_out;
wire        id_cond_pass;
wire        id_effective_reg_write;
wire        id_effective_mem_write;
wire        id_effective_flag_write;

//============================================================
// Global RF data adaptation: 16-bit ? 32-bit
//============================================================
wire [31:0] gprf_rdata_32;
assign gprf_rdata_32 = {{16{gprf_rdata[15]}}, gprf_rdata};

//============================================================
// EX/WB pipeline register
//============================================================
reg        ex_wb_valid;
reg [31:0] ex_wb_pc;
reg [31:0] ex_wb_instr;
reg        ex_wb_reg_write;
reg        ex_wb_mem_write;
reg        ex_wb_mem_to_reg;
reg        ex_wb_flag_write;
reg [3:0]  ex_wb_wa;
reg [31:0] ex_wb_alu_result;
reg [31:0] ex_wb_mem_rdata;  
reg [31:0] ex_wb_store_data;
reg [3:0]  ex_wb_flags_out;
reg        ex_wb_unsupported;

reg [3:0] flags;

//============================================================
// Control unit decode
//============================================================
control_unit u_control_unit (
    .instr       (id_instr),
    .instr_class (id_instr_class),
    .reg_write   (id_raw_reg_write),
    .mem_write   (id_raw_mem_write),
    .mem_to_reg  (id_mem_to_reg),
    .alu_src_imm (id_alu_src_imm),
    .alu_op      (id_alu_op),
    .flag_write  (id_raw_flag_write),
    .unsupported (id_unsupported_control)
);

assign id_is_mem_instr = (id_instr_class == CLASS_MEM);
assign id_is_str_instr = id_is_mem_instr && id_raw_mem_write;
assign id_ra1 = id_rn;
assign id_ra2 = id_is_str_instr ? id_rd : id_rm;
assign id_wa  = id_rd;

//============================================================
// Register file
//============================================================
wire [31:0] wb_data;

reg_file u_reg_file (
    .clk       (clk),
    .rst_n     (rst_n),
    .ra1       (id_ra1),
    .ra2       (id_ra2),
    .wa        (ex_wb_wa),
    .wd        (wb_data),
    .we        (ex_wb_valid && ex_wb_reg_write && internal_pc_enable), // ????
    .rd1       (rf_rd1_raw),
    .rd2       (rf_rd2_raw),
    .debug_r0  (),
    .debug_r1  (),
    .debug_r2  (),
    .debug_r3  ()
);

//============================================================
// Forwarding: EX/WB ? ID/EX
//============================================================
wire wb_can_forward;
assign wb_can_forward = ex_wb_valid && ex_wb_reg_write;

assign id_rd1_forwarded = (wb_can_forward && (ex_wb_wa == id_ra1)) ? wb_data : rf_rd1_raw;
assign id_rd2_forwarded = (wb_can_forward && (ex_wb_wa == id_ra2)) ? wb_data : rf_rd2_raw;

//============================================================
// Operand2 decode
//============================================================
operand2_decode u_operand2_decode (
    .instr       (id_instr),
    .rm_value    (id_rd2_forwarded),
    .operand2    (id_decoded_operand2),
    .unsupported (id_unsupported_operand2)
);

assign id_alu_b = id_is_mem_instr ? {20'b0, id_imm12} : id_decoded_operand2;

//============================================================
// ALU
//============================================================
alu u_alu (
    .a         (id_rd1_forwarded),
    .b         (id_alu_b),
    .alu_op    (id_alu_op),
    .result    (id_alu_result),
    .flags_out (id_alu_flags_out)
);

//============================================================
// Condition check
//============================================================
wire [3:0] flags_for_cond;
assign flags_for_cond = (ex_wb_valid && ex_wb_flag_write) ? ex_wb_flags_out : flags;

cond_unit u_cond_unit (
    .cond      (id_cond),
    .flags     (flags_for_cond),
    .cond_pass (id_cond_pass)
);

//============================================================
// Effective control signals
//============================================================
assign id_unsupported_total     = id_unsupported_control | id_unsupported_operand2;
assign id_effective_reg_write  = if_id_valid && id_raw_reg_write  && id_cond_pass && !id_unsupported_total;
assign id_effective_mem_write  = if_id_valid && id_raw_mem_write  && id_cond_pass && !id_unsupported_total;
assign id_effective_flag_write = if_id_valid && id_raw_flag_write && id_cond_pass && !id_unsupported_total;

//============================================================
// Global register file read address
//============================================================
assign gprf_raddr = id_alu_result[6:1];

wire [31:0] id_wb_data;
assign id_wb_data = id_mem_to_reg ? gprf_rdata_32 : id_alu_result;

//============================================================
// Stage 3: MEM/WB commit
//============================================================
assign wb_data = ex_wb_mem_to_reg ? ex_wb_mem_rdata : ex_wb_alu_result;

assign gprf_waddr = ex_wb_alu_result[6:1];
assign gprf_wdata = ex_wb_store_data[15:0];
assign gprf_we    = internal_pc_enable && ex_wb_valid && ex_wb_mem_write; // ????

//============================================================
// Pipeline registers
//============================================================
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        if_id_valid  <= 1'b0;
        if_id_pc     <= 32'b0;
        if_id_instr  <= NOP_INSTR;

        ex_wb_valid       <= 1'b0;
        ex_wb_pc          <= 32'b0;
        ex_wb_instr       <= NOP_INSTR;
        ex_wb_reg_write   <= 1'b0;
        ex_wb_mem_write   <= 1'b0;
        ex_wb_mem_to_reg  <= 1'b0;
        ex_wb_flag_write  <= 1'b0;
        ex_wb_wa          <= 4'b0;
        ex_wb_alu_result  <= 32'b0;
        ex_wb_mem_rdata   <= 32'b0;
        ex_wb_store_data  <= 32'b0;
        ex_wb_flags_out   <= 4'b0;
        ex_wb_unsupported <= 1'b0;

        flags <= 4'b0000;
    end else if (!internal_pc_enable) begin // ???????????????
        if_id_valid  <= 1'b0;
        if_id_pc     <= 32'b0;
        if_id_instr  <= NOP_INSTR;

        ex_wb_valid       <= 1'b0;
        ex_wb_pc          <= 32'b0;
        ex_wb_instr       <= NOP_INSTR;
        ex_wb_reg_write   <= 1'b0;
        ex_wb_mem_write   <= 1'b0;
        ex_wb_mem_to_reg  <= 1'b0;
        ex_wb_flag_write  <= 1'b0;
        ex_wb_wa          <= 4'b0;
        ex_wb_alu_result  <= 32'b0;
        ex_wb_mem_rdata   <= 32'b0;
        ex_wb_store_data  <= 32'b0;
        ex_wb_flags_out   <= 4'b0;
        ex_wb_unsupported <= 1'b0;
    end else begin
        if (ex_wb_valid && ex_wb_flag_write) begin
            flags <= ex_wb_flags_out;
        end

        if_id_valid <= 1'b1;
        if_id_pc    <= pc;
        if_id_instr <= if_instr;

        ex_wb_valid       <= if_id_valid;
        ex_wb_pc          <= id_pc;
        ex_wb_instr       <= id_instr;
        ex_wb_reg_write   <= id_effective_reg_write;
        ex_wb_mem_write   <= id_effective_mem_write;
        ex_wb_mem_to_reg  <= id_mem_to_reg && id_cond_pass && !id_unsupported_total && if_id_valid;
        ex_wb_flag_write  <= id_effective_flag_write;
        ex_wb_wa          <= id_wa;
        ex_wb_alu_result  <= id_alu_result;
        ex_wb_mem_rdata   <= gprf_rdata_32;  
        ex_wb_store_data  <= id_rd2_forwarded;
        ex_wb_flags_out   <= id_alu_flags_out;
        ex_wb_unsupported <= id_unsupported_total && if_id_valid;
    end
end

//============================================================
// Debug outputs
//============================================================
assign debug_pc          = ex_wb_valid ? ex_wb_pc         : 32'b0;
assign debug_instr       = ex_wb_valid ? ex_wb_instr      : NOP_INSTR;
assign debug_alu_result  = ex_wb_valid ? ex_wb_alu_result : 32'b0;
assign debug_mem_wdata   = ex_wb_valid ? ex_wb_store_data : 32'b0;
assign debug_mem_addr    = ex_wb_valid ? ex_wb_alu_result[6:1] : 6'b0;
assign debug_reg_wdata   = (ex_wb_valid && ex_wb_reg_write) ? wb_data : 32'b0;
assign debug_reg_waddr   = ex_wb_wa;
assign debug_reg_write   = ex_wb_valid && ex_wb_reg_write && internal_pc_enable;
assign debug_mem_write   = ex_wb_valid && ex_wb_mem_write && internal_pc_enable;
assign debug_flags       = flags;
assign debug_unsupported = ex_wb_valid && ex_wb_unsupported;

//============================================================
// Instruction ROM initialization
//============================================================
initial begin
    for (rom_init_idx = 0; rom_init_idx < ROM_DEPTH; rom_init_idx = rom_init_idx + 1) begin
        rom[rom_init_idx] = NOP_INSTR;
    end
    $readmemh(PROGRAM_FILE, rom);
end

endmodule // mcu_top