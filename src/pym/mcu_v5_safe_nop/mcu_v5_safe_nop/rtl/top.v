//============================================================
// Module: top (V5.1 16-Core Safe-NOP) — Pure Verilog-2001
//============================================================
`timescale 1ns/1ps

module top #(
    parameter INSTR_ROM_ADDR_WIDTH = 12,
    parameter N_DATA               = 64
,    parameter DONE_PC_CORE00 = 32'h000003A8
,    parameter DONE_PC_CORE01 = 32'h000003A8
,    parameter DONE_PC_CORE02 = 32'h000003A8
,    parameter DONE_PC_CORE03 = 32'h000003A8
,    parameter DONE_PC_CORE04 = 32'h000003A8
,    parameter DONE_PC_CORE05 = 32'h000003A8
,    parameter DONE_PC_CORE06 = 32'h000003A8
,    parameter DONE_PC_CORE07 = 32'h000003A8
,    parameter DONE_PC_CORE08 = 32'h000003A8
,    parameter DONE_PC_CORE09 = 32'h000003A8
,    parameter DONE_PC_CORE10 = 32'h000003A8
,    parameter DONE_PC_CORE11 = 32'h000003A8
,    parameter DONE_PC_CORE12 = 32'h000003A8
,    parameter DONE_PC_CORE13 = 32'h000003A8
,    parameter DONE_PC_CORE14 = 32'h000003A8
,    parameter DONE_PC_CORE15 = 32'h000003A8
)(
    input wire clk_osc,
    input wire rst
);

wire clk;
sys_clk u_sys_clk (.clk_out1(clk), .clk_in1(clk_osc));
wire rst_n = ~rst;

localparam ST_IDLE=3'd0, ST_LOAD_STREAM=3'd1, ST_RUN=3'd5, ST_WRITE=3'd6, ST_DONE=3'd7;
reg [2:0] state; reg [5:0] load_index, write_index;
localparam [5:0] LAST_INDEX = N_DATA - 1;

reg [5:0] load_addr_pipe0, load_addr_pipe1;
reg load_valid_pipe0, load_valid_pipe1, load_all_issued, load_write_done;
wire load_can_issue   = (state == ST_LOAD_STREAM) && !load_all_issued;
wire load_write_valid = (state == ST_LOAD_STREAM) && load_valid_pipe1;

wire test_rom_en = (state == ST_LOAD_STREAM) && !load_all_issued;
wire [5:0] test_rom_addr; assign test_rom_addr = load_index;
wire [15:0] test_vector_in;
test_ROM u_test_ROM (.clka(clk), .ena(test_rom_en), .addra(test_rom_addr), .douta(test_vector_in));

wire verify_ram_en = (state == ST_WRITE);
wire [0:0] verify_ram_we; assign verify_ram_we = (state == ST_WRITE) ? 1'b1 : 1'b0;
wire [5:0] verify_ram_addr; assign verify_ram_addr = write_index;
wire [15:0] verify_vector_out; assign verify_vector_out = gprf_rdata0;
wire [15:0] verify_ram_dout;
verify_RAM u_verify_RAM (.clka(clk), .ena(verify_ram_en), .wea(verify_ram_we), .addra(verify_ram_addr), .dina(verify_vector_out), .douta(verify_ram_dout));

wire [5:0]  gprf_raddr0;
wire [5:0]  gprf_raddr1;
wire [5:0]  gprf_raddr2;
wire [5:0]  gprf_raddr3;
wire [5:0]  gprf_raddr4;
wire [5:0]  gprf_raddr5;
wire [5:0]  gprf_raddr6;
wire [5:0]  gprf_raddr7;
wire [5:0]  gprf_raddr8;
wire [5:0]  gprf_raddr9;
wire [5:0]  gprf_raddr10;
wire [5:0]  gprf_raddr11;
wire [5:0]  gprf_raddr12;
wire [5:0]  gprf_raddr13;
wire [5:0]  gprf_raddr14;
wire [5:0]  gprf_raddr15;
wire [15:0] gprf_rdata0;
wire [15:0] gprf_rdata1;
wire [15:0] gprf_rdata2;
wire [15:0] gprf_rdata3;
wire [15:0] gprf_rdata4;
wire [15:0] gprf_rdata5;
wire [15:0] gprf_rdata6;
wire [15:0] gprf_rdata7;
wire [15:0] gprf_rdata8;
wire [15:0] gprf_rdata9;
wire [15:0] gprf_rdata10;
wire [15:0] gprf_rdata11;
wire [15:0] gprf_rdata12;
wire [15:0] gprf_rdata13;
wire [15:0] gprf_rdata14;
wire [15:0] gprf_rdata15;
wire [5:0]  gprf_waddr0;
wire [5:0]  gprf_waddr1;
wire [5:0]  gprf_waddr2;
wire [5:0]  gprf_waddr3;
wire [5:0]  gprf_waddr4;
wire [5:0]  gprf_waddr5;
wire [5:0]  gprf_waddr6;
wire [5:0]  gprf_waddr7;
wire [5:0]  gprf_waddr8;
wire [5:0]  gprf_waddr9;
wire [5:0]  gprf_waddr10;
wire [5:0]  gprf_waddr11;
wire [5:0]  gprf_waddr12;
wire [5:0]  gprf_waddr13;
wire [5:0]  gprf_waddr14;
wire [5:0]  gprf_waddr15;
wire [15:0] gprf_wdata0;
wire [15:0] gprf_wdata1;
wire [15:0] gprf_wdata2;
wire [15:0] gprf_wdata3;
wire [15:0] gprf_wdata4;
wire [15:0] gprf_wdata5;
wire [15:0] gprf_wdata6;
wire [15:0] gprf_wdata7;
wire [15:0] gprf_wdata8;
wire [15:0] gprf_wdata9;
wire [15:0] gprf_wdata10;
wire [15:0] gprf_wdata11;
wire [15:0] gprf_wdata12;
wire [15:0] gprf_wdata13;
wire [15:0] gprf_wdata14;
wire [15:0] gprf_wdata15;
wire        gprf_we0;
wire        gprf_we1;
wire        gprf_we2;
wire        gprf_we3;
wire        gprf_we4;
wire        gprf_we5;
wire        gprf_we6;
wire        gprf_we7;
wire        gprf_we8;
wire        gprf_we9;
wire        gprf_we10;
wire        gprf_we11;
wire        gprf_we12;
wire        gprf_we13;
wire        gprf_we14;
wire        gprf_we15;
wire [5:0]  c0_raddr;
wire [5:0]  c1_raddr;
wire [5:0]  c2_raddr;
wire [5:0]  c3_raddr;
wire [5:0]  c4_raddr;
wire [5:0]  c5_raddr;
wire [5:0]  c6_raddr;
wire [5:0]  c7_raddr;
wire [5:0]  c8_raddr;
wire [5:0]  c9_raddr;
wire [5:0]  c10_raddr;
wire [5:0]  c11_raddr;
wire [5:0]  c12_raddr;
wire [5:0]  c13_raddr;
wire [5:0]  c14_raddr;
wire [5:0]  c15_raddr;
wire [15:0] c0_wdata;
wire [15:0] c1_wdata;
wire [15:0] c2_wdata;
wire [15:0] c3_wdata;
wire [15:0] c4_wdata;
wire [15:0] c5_wdata;
wire [15:0] c6_wdata;
wire [15:0] c7_wdata;
wire [15:0] c8_wdata;
wire [15:0] c9_wdata;
wire [15:0] c10_wdata;
wire [15:0] c11_wdata;
wire [15:0] c12_wdata;
wire [15:0] c13_wdata;
wire [15:0] c14_wdata;
wire [15:0] c15_wdata;
wire [5:0]  c0_waddr;
wire [5:0]  c1_waddr;
wire [5:0]  c2_waddr;
wire [5:0]  c3_waddr;
wire [5:0]  c4_waddr;
wire [5:0]  c5_waddr;
wire [5:0]  c6_waddr;
wire [5:0]  c7_waddr;
wire [5:0]  c8_waddr;
wire [5:0]  c9_waddr;
wire [5:0]  c10_waddr;
wire [5:0]  c11_waddr;
wire [5:0]  c12_waddr;
wire [5:0]  c13_waddr;
wire [5:0]  c14_waddr;
wire [5:0]  c15_waddr;
wire        c0_we;
wire        c1_we;
wire        c2_we;
wire        c3_we;
wire        c4_we;
wire        c5_we;
wire        c6_we;
wire        c7_we;
wire        c8_we;
wire        c9_we;
wire        c10_we;
wire        c11_we;
wire        c12_we;
wire        c13_we;
wire        c14_we;
wire        c15_we;

assign gprf_raddr0  = (state == ST_WRITE) ? write_index : c0_raddr;
assign gprf_raddr1  = c1_raddr;
assign gprf_raddr2  = c2_raddr;
assign gprf_raddr3  = c3_raddr;
assign gprf_raddr4  = c4_raddr;
assign gprf_raddr5  = c5_raddr;
assign gprf_raddr6  = c6_raddr;
assign gprf_raddr7  = c7_raddr;
assign gprf_raddr8  = c8_raddr;
assign gprf_raddr9  = c9_raddr;
assign gprf_raddr10  = c10_raddr;
assign gprf_raddr11  = c11_raddr;
assign gprf_raddr12  = c12_raddr;
assign gprf_raddr13  = c13_raddr;
assign gprf_raddr14  = c14_raddr;
assign gprf_raddr15  = c15_raddr;

assign gprf_waddr0  = (state == ST_LOAD_STREAM) ? load_addr_pipe1 : c0_waddr;
assign gprf_wdata0  = (state == ST_LOAD_STREAM) ? test_vector_in   : c0_wdata;
assign gprf_we0     = (state == ST_LOAD_STREAM) ? load_write_valid  : c0_we;
assign gprf_waddr1 = c1_waddr;
assign gprf_wdata1 = c1_wdata;
assign gprf_we1    = c1_we;
assign gprf_waddr2 = c2_waddr;
assign gprf_wdata2 = c2_wdata;
assign gprf_we2    = c2_we;
assign gprf_waddr3 = c3_waddr;
assign gprf_wdata3 = c3_wdata;
assign gprf_we3    = c3_we;
assign gprf_waddr4 = c4_waddr;
assign gprf_wdata4 = c4_wdata;
assign gprf_we4    = c4_we;
assign gprf_waddr5 = c5_waddr;
assign gprf_wdata5 = c5_wdata;
assign gprf_we5    = c5_we;
assign gprf_waddr6 = c6_waddr;
assign gprf_wdata6 = c6_wdata;
assign gprf_we6    = c6_we;
assign gprf_waddr7 = c7_waddr;
assign gprf_wdata7 = c7_wdata;
assign gprf_we7    = c7_we;
assign gprf_waddr8 = c8_waddr;
assign gprf_wdata8 = c8_wdata;
assign gprf_we8    = c8_we;
assign gprf_waddr9 = c9_waddr;
assign gprf_wdata9 = c9_wdata;
assign gprf_we9    = c9_we;
assign gprf_waddr10 = c10_waddr;
assign gprf_wdata10 = c10_wdata;
assign gprf_we10    = c10_we;
assign gprf_waddr11 = c11_waddr;
assign gprf_wdata11 = c11_wdata;
assign gprf_we11    = c11_we;
assign gprf_waddr12 = c12_waddr;
assign gprf_wdata12 = c12_wdata;
assign gprf_we12    = c12_we;
assign gprf_waddr13 = c13_waddr;
assign gprf_wdata13 = c13_wdata;
assign gprf_we13    = c13_we;
assign gprf_waddr14 = c14_waddr;
assign gprf_wdata14 = c14_wdata;
assign gprf_we14    = c14_we;
assign gprf_waddr15 = c15_waddr;
assign gprf_wdata15 = c15_wdata;
assign gprf_we15    = c15_we;

global_rf_16w16r u_global_rf (
    .clk(clk), .rst_n(rst_n),
    .raddr0(gprf_raddr0), .rdata0(gprf_rdata0),
    .raddr1(gprf_raddr1), .rdata1(gprf_rdata1),
    .raddr2(gprf_raddr2), .rdata2(gprf_rdata2),
    .raddr3(gprf_raddr3), .rdata3(gprf_rdata3),
    .raddr4(gprf_raddr4), .rdata4(gprf_rdata4),
    .raddr5(gprf_raddr5), .rdata5(gprf_rdata5),
    .raddr6(gprf_raddr6), .rdata6(gprf_rdata6),
    .raddr7(gprf_raddr7), .rdata7(gprf_rdata7),
    .raddr8(gprf_raddr8), .rdata8(gprf_rdata8),
    .raddr9(gprf_raddr9), .rdata9(gprf_rdata9),
    .raddr10(gprf_raddr10), .rdata10(gprf_rdata10),
    .raddr11(gprf_raddr11), .rdata11(gprf_rdata11),
    .raddr12(gprf_raddr12), .rdata12(gprf_rdata12),
    .raddr13(gprf_raddr13), .rdata13(gprf_rdata13),
    .raddr14(gprf_raddr14), .rdata14(gprf_rdata14),
    .raddr15(gprf_raddr15), .rdata15(gprf_rdata15),
    .waddr0(gprf_waddr0), .wdata0(gprf_wdata0), .we0(gprf_we0),
    .waddr1(gprf_waddr1), .wdata1(gprf_wdata1), .we1(gprf_we1),
    .waddr2(gprf_waddr2), .wdata2(gprf_wdata2), .we2(gprf_we2),
    .waddr3(gprf_waddr3), .wdata3(gprf_wdata3), .we3(gprf_we3),
    .waddr4(gprf_waddr4), .wdata4(gprf_wdata4), .we4(gprf_we4),
    .waddr5(gprf_waddr5), .wdata5(gprf_wdata5), .we5(gprf_we5),
    .waddr6(gprf_waddr6), .wdata6(gprf_wdata6), .we6(gprf_we6),
    .waddr7(gprf_waddr7), .wdata7(gprf_wdata7), .we7(gprf_we7),
    .waddr8(gprf_waddr8), .wdata8(gprf_wdata8), .we8(gprf_we8),
    .waddr9(gprf_waddr9), .wdata9(gprf_wdata9), .we9(gprf_we9),
    .waddr10(gprf_waddr10), .wdata10(gprf_wdata10), .we10(gprf_we10),
    .waddr11(gprf_waddr11), .wdata11(gprf_wdata11), .we11(gprf_we11),
    .waddr12(gprf_waddr12), .wdata12(gprf_wdata12), .we12(gprf_we12),
    .waddr13(gprf_waddr13), .wdata13(gprf_wdata13), .we13(gprf_we13),
    .waddr14(gprf_waddr14), .wdata14(gprf_wdata14), .we14(gprf_we14),
    .waddr15(gprf_waddr15), .wdata15(gprf_wdata15), .we15(gprf_we15)
);

wire mcu_rst       = rst || (state != ST_RUN);
wire mcu_pc_enable = (state == ST_RUN);

wire [31:0] debug_pc0;
wire [31:0] debug_pc1;
wire [31:0] debug_pc2;
wire [31:0] debug_pc3;
wire [31:0] debug_pc4;
wire [31:0] debug_pc5;
wire [31:0] debug_pc6;
wire [31:0] debug_pc7;
wire [31:0] debug_pc8;
wire [31:0] debug_pc9;
wire [31:0] debug_pc10;
wire [31:0] debug_pc11;
wire [31:0] debug_pc12;
wire [31:0] debug_pc13;
wire [31:0] debug_pc14;
wire [31:0] debug_pc15;
wire        core_done0;
wire        core_done1;
wire        core_done2;
wire        core_done3;
wire        core_done4;
wire        core_done5;
wire        core_done6;
wire        core_done7;
wire        core_done8;
wire        core_done9;
wire        core_done10;
wire        core_done11;
wire        core_done12;
wire        core_done13;
wire        core_done14;
wire        core_done15;

mcu_top #(.CORE_ID(0), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_00.hex"), .DONE_PC(DONE_PC_CORE00)) u_core0 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c0_raddr), .gprf_rdata(gprf_rdata0),
    .gprf_waddr(c0_waddr), .gprf_wdata(c0_wdata), .gprf_we(c0_we),
    .debug_pc(debug_pc0), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done0)
);

mcu_top #(.CORE_ID(1), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_01.hex"), .DONE_PC(DONE_PC_CORE01)) u_core1 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c1_raddr), .gprf_rdata(gprf_rdata1),
    .gprf_waddr(c1_waddr), .gprf_wdata(c1_wdata), .gprf_we(c1_we),
    .debug_pc(debug_pc1), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done1)
);

mcu_top #(.CORE_ID(2), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_02.hex"), .DONE_PC(DONE_PC_CORE02)) u_core2 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c2_raddr), .gprf_rdata(gprf_rdata2),
    .gprf_waddr(c2_waddr), .gprf_wdata(c2_wdata), .gprf_we(c2_we),
    .debug_pc(debug_pc2), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done2)
);

mcu_top #(.CORE_ID(3), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_03.hex"), .DONE_PC(DONE_PC_CORE03)) u_core3 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c3_raddr), .gprf_rdata(gprf_rdata3),
    .gprf_waddr(c3_waddr), .gprf_wdata(c3_wdata), .gprf_we(c3_we),
    .debug_pc(debug_pc3), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done3)
);

mcu_top #(.CORE_ID(4), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_04.hex"), .DONE_PC(DONE_PC_CORE04)) u_core4 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c4_raddr), .gprf_rdata(gprf_rdata4),
    .gprf_waddr(c4_waddr), .gprf_wdata(c4_wdata), .gprf_we(c4_we),
    .debug_pc(debug_pc4), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done4)
);

mcu_top #(.CORE_ID(5), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_05.hex"), .DONE_PC(DONE_PC_CORE05)) u_core5 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c5_raddr), .gprf_rdata(gprf_rdata5),
    .gprf_waddr(c5_waddr), .gprf_wdata(c5_wdata), .gprf_we(c5_we),
    .debug_pc(debug_pc5), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done5)
);

mcu_top #(.CORE_ID(6), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_06.hex"), .DONE_PC(DONE_PC_CORE06)) u_core6 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c6_raddr), .gprf_rdata(gprf_rdata6),
    .gprf_waddr(c6_waddr), .gprf_wdata(c6_wdata), .gprf_we(c6_we),
    .debug_pc(debug_pc6), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done6)
);

mcu_top #(.CORE_ID(7), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_07.hex"), .DONE_PC(DONE_PC_CORE07)) u_core7 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c7_raddr), .gprf_rdata(gprf_rdata7),
    .gprf_waddr(c7_waddr), .gprf_wdata(c7_wdata), .gprf_we(c7_we),
    .debug_pc(debug_pc7), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done7)
);

mcu_top #(.CORE_ID(8), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_08.hex"), .DONE_PC(DONE_PC_CORE08)) u_core8 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c8_raddr), .gprf_rdata(gprf_rdata8),
    .gprf_waddr(c8_waddr), .gprf_wdata(c8_wdata), .gprf_we(c8_we),
    .debug_pc(debug_pc8), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done8)
);

mcu_top #(.CORE_ID(9), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_09.hex"), .DONE_PC(DONE_PC_CORE09)) u_core9 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c9_raddr), .gprf_rdata(gprf_rdata9),
    .gprf_waddr(c9_waddr), .gprf_wdata(c9_wdata), .gprf_we(c9_we),
    .debug_pc(debug_pc9), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done9)
);

mcu_top #(.CORE_ID(10), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_10.hex"), .DONE_PC(DONE_PC_CORE10)) u_core10 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c10_raddr), .gprf_rdata(gprf_rdata10),
    .gprf_waddr(c10_waddr), .gprf_wdata(c10_wdata), .gprf_we(c10_we),
    .debug_pc(debug_pc10), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done10)
);

mcu_top #(.CORE_ID(11), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_11.hex"), .DONE_PC(DONE_PC_CORE11)) u_core11 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c11_raddr), .gprf_rdata(gprf_rdata11),
    .gprf_waddr(c11_waddr), .gprf_wdata(c11_wdata), .gprf_we(c11_we),
    .debug_pc(debug_pc11), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done11)
);

mcu_top #(.CORE_ID(12), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_12.hex"), .DONE_PC(DONE_PC_CORE12)) u_core12 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c12_raddr), .gprf_rdata(gprf_rdata12),
    .gprf_waddr(c12_waddr), .gprf_wdata(c12_wdata), .gprf_we(c12_we),
    .debug_pc(debug_pc12), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done12)
);

mcu_top #(.CORE_ID(13), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_13.hex"), .DONE_PC(DONE_PC_CORE13)) u_core13 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c13_raddr), .gprf_rdata(gprf_rdata13),
    .gprf_waddr(c13_waddr), .gprf_wdata(c13_wdata), .gprf_we(c13_we),
    .debug_pc(debug_pc13), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done13)
);

mcu_top #(.CORE_ID(14), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_14.hex"), .DONE_PC(DONE_PC_CORE14)) u_core14 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c14_raddr), .gprf_rdata(gprf_rdata14),
    .gprf_waddr(c14_waddr), .gprf_wdata(c14_wdata), .gprf_we(c14_we),
    .debug_pc(debug_pc14), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done14)
);

mcu_top #(.CORE_ID(15), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v5/programs/core_15.hex"), .DONE_PC(DONE_PC_CORE15)) u_core15 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c15_raddr), .gprf_rdata(gprf_rdata15),
    .gprf_waddr(c15_waddr), .gprf_wdata(c15_wdata), .gprf_we(c15_we),
    .debug_pc(debug_pc15), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done15)
);

wire all_cores_done = core_done0 && core_done1 && core_done2 && core_done3 && core_done4 && core_done5 && core_done6 && core_done7 && core_done8 && core_done9 && core_done10 && core_done11 && core_done12 && core_done13 && core_done14 && core_done15;
wire done = (state == ST_DONE);

reg  start_flag, stop_flag;
wire [19:0] cnt_test;
cnt_test u_cnt_test (.clk(clk), .rst_n(rst_n), .start_flag(start_flag), .stop_flag(stop_flag), .cnt_test(cnt_test));

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= ST_IDLE; load_index <= 6'd0;
        load_addr_pipe0 <= 6'd0; load_valid_pipe0 <= 1'b0;
        load_addr_pipe1 <= 6'd0; load_valid_pipe1 <= 1'b0;
        load_all_issued <= 1'b0; load_write_done <= 1'b0;
        write_index <= 6'd0; start_flag <= 1'b0; stop_flag <= 1'b0;
    end else begin
        start_flag <= 1'b0; stop_flag <= 1'b0;
        case (state)
            ST_IDLE: begin
                load_index <= 6'd0; load_addr_pipe0 <= 6'd0; load_valid_pipe0 <= 1'b0;
                load_addr_pipe1 <= 6'd0; load_valid_pipe1 <= 1'b0;
                load_all_issued <= 1'b0; load_write_done <= 1'b0; write_index <= 6'd0;
                state <= ST_LOAD_STREAM; start_flag <= 1'b1;
            end
            ST_LOAD_STREAM: begin
                load_addr_pipe0  <= load_index; load_valid_pipe0 <= load_can_issue;
                load_addr_pipe1  <= load_addr_pipe0; load_valid_pipe1 <= load_valid_pipe0;
                if (load_can_issue) begin
                    if (load_index == LAST_INDEX) load_all_issued <= 1'b1;
                    else load_index <= load_index + 6'd1;
                end
                if (load_write_valid && (load_addr_pipe1 == LAST_INDEX)) load_write_done <= 1'b1;
                if (load_all_issued && load_write_done) begin
                    load_index <= 6'd0; load_valid_pipe0 <= 1'b0; load_valid_pipe1 <= 1'b0;
                    state <= ST_RUN;
                end
            end
            ST_RUN: if (all_cores_done) begin write_index <= 6'd0; state <= ST_WRITE; end
            ST_WRITE: begin
                if (write_index == LAST_INDEX) begin stop_flag <= 1'b1; state <= ST_DONE; end
                else write_index <= write_index + 6'd1;
            end
            ST_DONE: state <= ST_DONE;
            default: state <= ST_IDLE;
        endcase
    end
end

ila_0 u_ila (.clk(clk), .probe0(test_vector_in), .probe1(verify_vector_out), .probe2(cnt_test), .probe3(state), .probe4(debug_pc0));

endmodule