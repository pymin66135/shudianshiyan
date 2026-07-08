// ============================================================
// Program Structure:
// 1. Module Declaration & Parameters
// 2. Clock & Reset Management
// 3. State Machine & Control Signals Definition
// 4. Test ROM (Dual-port load) & Verify RAM (Single-port write) Instantiations
// 5. Global Register File (GPRF) Interface & Instantiation
// 6. 32 MCU Cores Instantiation & Connection
// 7. Output Verification Logic & Main Control Process
// ============================================================

`timescale 1ns/1ps

module top #(
    parameter INSTR_ROM_ADDR_WIDTH = 12,
    parameter N_DATA               = 64
,    parameter DONE_PC_CORE00 = 32'h000001F8
,    parameter DONE_PC_CORE01 = 32'h000001F8
,    parameter DONE_PC_CORE02 = 32'h000001F8
,    parameter DONE_PC_CORE03 = 32'h000001F8
,    parameter DONE_PC_CORE04 = 32'h000001F8
,    parameter DONE_PC_CORE05 = 32'h000001F8
,    parameter DONE_PC_CORE06 = 32'h000001F8
,    parameter DONE_PC_CORE07 = 32'h000001F8
,    parameter DONE_PC_CORE08 = 32'h000001F8
,    parameter DONE_PC_CORE09 = 32'h000001F8
,    parameter DONE_PC_CORE10 = 32'h000001F8
,    parameter DONE_PC_CORE11 = 32'h000001F8
,    parameter DONE_PC_CORE12 = 32'h000001F8
,    parameter DONE_PC_CORE13 = 32'h000001F8
,    parameter DONE_PC_CORE14 = 32'h000001F8
,    parameter DONE_PC_CORE15 = 32'h000001F8
,    parameter DONE_PC_CORE16 = 32'h000001F8
,    parameter DONE_PC_CORE17 = 32'h000001F8
,    parameter DONE_PC_CORE18 = 32'h000001F8
,    parameter DONE_PC_CORE19 = 32'h000001F8
,    parameter DONE_PC_CORE20 = 32'h000001F8
,    parameter DONE_PC_CORE21 = 32'h000001F8
,    parameter DONE_PC_CORE22 = 32'h000001F8
,    parameter DONE_PC_CORE23 = 32'h000001F8
,    parameter DONE_PC_CORE24 = 32'h000001F8
,    parameter DONE_PC_CORE25 = 32'h000001F8
,    parameter DONE_PC_CORE26 = 32'h000001F8
,    parameter DONE_PC_CORE27 = 32'h000001F8
,    parameter DONE_PC_CORE28 = 32'h000001F8
,    parameter DONE_PC_CORE29 = 32'h000001F8
,    parameter DONE_PC_CORE30 = 32'h000001F8
,    parameter DONE_PC_CORE31 = 32'h000001F8
)(
    input wire clk_osc,
    input wire rst
);

wire clk;
sys_clk u_sys_clk (.clk_out1(clk), .clk_in1(clk_osc));
wire rst_n = ~rst;

localparam ST_IDLE=3'd0, ST_LOAD_STREAM=3'd1, ST_RUN=3'd5, ST_WRITE=3'd6, ST_DONE=3'd7;
(* max_fanout = "16" *) reg [2:0] state;
reg [5:0] load_index, write_index;
localparam [5:0] LAST_PAIR_BASE  = N_DATA - 2;
localparam [5:0] LAST_INDEX      = N_DATA - 1;

reg [5:0] load_addr_pipe0, load_addr_pipe1;
reg load_valid_pipe0, load_valid_pipe1, load_all_issued, load_write_done;
reg [15:0] load_data_pipe1_a, load_data_pipe1_b;
wire load_can_issue   = (state == ST_LOAD_STREAM) && !load_all_issued;
wire load_write_valid = (state == ST_LOAD_STREAM) && load_valid_pipe1;

wire test_rom_ena = load_can_issue;
wire test_rom_enb = load_can_issue;
wire test_rom_en  = test_rom_ena;
wire [5:0] test_rom_addr_a; assign test_rom_addr_a = load_index;
wire [5:0] test_rom_addr_b; assign test_rom_addr_b = load_index + 6'd1;
wire [5:0] test_rom_addr;   assign test_rom_addr   = test_rom_addr_a;
wire [15:0] test_vector_in_a;
wire [15:0] test_vector_in_b;
wire [15:0] test_vector_in; assign test_vector_in = test_vector_in_a;

test_ROM u_test_ROM (
    .clka(clk), .ena(test_rom_ena), .addra(test_rom_addr_a), .douta(test_vector_in_a),
    .clkb(clk), .enb(test_rom_enb), .addrb(test_rom_addr_b), .doutb(test_vector_in_b)
);

wire verify_ram_ena = (state == ST_WRITE);
wire verify_ram_en  = verify_ram_ena;
wire [0:0] verify_ram_wea; assign verify_ram_wea = (state == ST_WRITE) ? 1'b1 : 1'b0;
wire [0:0] verify_ram_we;  assign verify_ram_we  = verify_ram_wea;
wire [5:0] verify_ram_addr_a; assign verify_ram_addr_a = write_index;
wire [5:0] verify_ram_addr;   assign verify_ram_addr   = verify_ram_addr_a;
wire [15:0] verify_vector_out_a; assign verify_vector_out_a = gprf_rdata0;
wire [15:0] verify_vector_out;   assign verify_vector_out   = verify_vector_out_a;
wire [15:0] verify_ram_dout_a;
wire [15:0] verify_ram_dout; assign verify_ram_dout = verify_ram_dout_a;

verify_RAM u_verify_RAM (
    .clka(clk), .ena(verify_ram_ena), .wea(verify_ram_wea), .addra(verify_ram_addr_a), .dina(verify_vector_out_a), .douta(verify_ram_dout_a)
);

wire [5:0] gprf_raddr0;
wire [5:0] gprf_raddr1;
wire [5:0] gprf_raddr2;
wire [5:0] gprf_raddr3;
wire [5:0] gprf_raddr4;
wire [5:0] gprf_raddr5;
wire [5:0] gprf_raddr6;
wire [5:0] gprf_raddr7;
wire [5:0] gprf_raddr8;
wire [5:0] gprf_raddr9;
wire [5:0] gprf_raddr10;
wire [5:0] gprf_raddr11;
wire [5:0] gprf_raddr12;
wire [5:0] gprf_raddr13;
wire [5:0] gprf_raddr14;
wire [5:0] gprf_raddr15;
wire [5:0] gprf_raddr16;
wire [5:0] gprf_raddr17;
wire [5:0] gprf_raddr18;
wire [5:0] gprf_raddr19;
wire [5:0] gprf_raddr20;
wire [5:0] gprf_raddr21;
wire [5:0] gprf_raddr22;
wire [5:0] gprf_raddr23;
wire [5:0] gprf_raddr24;
wire [5:0] gprf_raddr25;
wire [5:0] gprf_raddr26;
wire [5:0] gprf_raddr27;
wire [5:0] gprf_raddr28;
wire [5:0] gprf_raddr29;
wire [5:0] gprf_raddr30;
wire [5:0] gprf_raddr31;
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
wire [15:0] gprf_rdata16;
wire [15:0] gprf_rdata17;
wire [15:0] gprf_rdata18;
wire [15:0] gprf_rdata19;
wire [15:0] gprf_rdata20;
wire [15:0] gprf_rdata21;
wire [15:0] gprf_rdata22;
wire [15:0] gprf_rdata23;
wire [15:0] gprf_rdata24;
wire [15:0] gprf_rdata25;
wire [15:0] gprf_rdata26;
wire [15:0] gprf_rdata27;
wire [15:0] gprf_rdata28;
wire [15:0] gprf_rdata29;
wire [15:0] gprf_rdata30;
wire [15:0] gprf_rdata31;
wire [5:0] gprf_waddr0;
wire [5:0] gprf_waddr1;
wire [5:0] gprf_waddr2;
wire [5:0] gprf_waddr3;
wire [5:0] gprf_waddr4;
wire [5:0] gprf_waddr5;
wire [5:0] gprf_waddr6;
wire [5:0] gprf_waddr7;
wire [5:0] gprf_waddr8;
wire [5:0] gprf_waddr9;
wire [5:0] gprf_waddr10;
wire [5:0] gprf_waddr11;
wire [5:0] gprf_waddr12;
wire [5:0] gprf_waddr13;
wire [5:0] gprf_waddr14;
wire [5:0] gprf_waddr15;
wire [5:0] gprf_waddr16;
wire [5:0] gprf_waddr17;
wire [5:0] gprf_waddr18;
wire [5:0] gprf_waddr19;
wire [5:0] gprf_waddr20;
wire [5:0] gprf_waddr21;
wire [5:0] gprf_waddr22;
wire [5:0] gprf_waddr23;
wire [5:0] gprf_waddr24;
wire [5:0] gprf_waddr25;
wire [5:0] gprf_waddr26;
wire [5:0] gprf_waddr27;
wire [5:0] gprf_waddr28;
wire [5:0] gprf_waddr29;
wire [5:0] gprf_waddr30;
wire [5:0] gprf_waddr31;
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
wire [15:0] gprf_wdata16;
wire [15:0] gprf_wdata17;
wire [15:0] gprf_wdata18;
wire [15:0] gprf_wdata19;
wire [15:0] gprf_wdata20;
wire [15:0] gprf_wdata21;
wire [15:0] gprf_wdata22;
wire [15:0] gprf_wdata23;
wire [15:0] gprf_wdata24;
wire [15:0] gprf_wdata25;
wire [15:0] gprf_wdata26;
wire [15:0] gprf_wdata27;
wire [15:0] gprf_wdata28;
wire [15:0] gprf_wdata29;
wire [15:0] gprf_wdata30;
wire [15:0] gprf_wdata31;
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
wire        gprf_we16;
wire        gprf_we17;
wire        gprf_we18;
wire        gprf_we19;
wire        gprf_we20;
wire        gprf_we21;
wire        gprf_we22;
wire        gprf_we23;
wire        gprf_we24;
wire        gprf_we25;
wire        gprf_we26;
wire        gprf_we27;
wire        gprf_we28;
wire        gprf_we29;
wire        gprf_we30;
wire        gprf_we31;
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
wire [5:0]  c16_raddr;
wire [5:0]  c17_raddr;
wire [5:0]  c18_raddr;
wire [5:0]  c19_raddr;
wire [5:0]  c20_raddr;
wire [5:0]  c21_raddr;
wire [5:0]  c22_raddr;
wire [5:0]  c23_raddr;
wire [5:0]  c24_raddr;
wire [5:0]  c25_raddr;
wire [5:0]  c26_raddr;
wire [5:0]  c27_raddr;
wire [5:0]  c28_raddr;
wire [5:0]  c29_raddr;
wire [5:0]  c30_raddr;
wire [5:0]  c31_raddr;
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
wire [15:0] c16_wdata;
wire [15:0] c17_wdata;
wire [15:0] c18_wdata;
wire [15:0] c19_wdata;
wire [15:0] c20_wdata;
wire [15:0] c21_wdata;
wire [15:0] c22_wdata;
wire [15:0] c23_wdata;
wire [15:0] c24_wdata;
wire [15:0] c25_wdata;
wire [15:0] c26_wdata;
wire [15:0] c27_wdata;
wire [15:0] c28_wdata;
wire [15:0] c29_wdata;
wire [15:0] c30_wdata;
wire [15:0] c31_wdata;
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
wire [5:0]  c16_waddr;
wire [5:0]  c17_waddr;
wire [5:0]  c18_waddr;
wire [5:0]  c19_waddr;
wire [5:0]  c20_waddr;
wire [5:0]  c21_waddr;
wire [5:0]  c22_waddr;
wire [5:0]  c23_waddr;
wire [5:0]  c24_waddr;
wire [5:0]  c25_waddr;
wire [5:0]  c26_waddr;
wire [5:0]  c27_waddr;
wire [5:0]  c28_waddr;
wire [5:0]  c29_waddr;
wire [5:0]  c30_waddr;
wire [5:0]  c31_waddr;
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
wire        c16_we;
wire        c17_we;
wire        c18_we;
wire        c19_we;
wire        c20_we;
wire        c21_we;
wire        c22_we;
wire        c23_we;
wire        c24_we;
wire        c25_we;
wire        c26_we;
wire        c27_we;
wire        c28_we;
wire        c29_we;
wire        c30_we;
wire        c31_we;

assign gprf_raddr0 = (state == ST_WRITE) ? write_index : c0_raddr;
assign gprf_raddr1 = c1_raddr;
assign gprf_raddr2 = c2_raddr;
assign gprf_raddr3 = c3_raddr;
assign gprf_raddr4 = c4_raddr;
assign gprf_raddr5 = c5_raddr;
assign gprf_raddr6 = c6_raddr;
assign gprf_raddr7 = c7_raddr;
assign gprf_raddr8 = c8_raddr;
assign gprf_raddr9 = c9_raddr;
assign gprf_raddr10 = c10_raddr;
assign gprf_raddr11 = c11_raddr;
assign gprf_raddr12 = c12_raddr;
assign gprf_raddr13 = c13_raddr;
assign gprf_raddr14 = c14_raddr;
assign gprf_raddr15 = c15_raddr;
assign gprf_raddr16 = c16_raddr;
assign gprf_raddr17 = c17_raddr;
assign gprf_raddr18 = c18_raddr;
assign gprf_raddr19 = c19_raddr;
assign gprf_raddr20 = c20_raddr;
assign gprf_raddr21 = c21_raddr;
assign gprf_raddr22 = c22_raddr;
assign gprf_raddr23 = c23_raddr;
assign gprf_raddr24 = c24_raddr;
assign gprf_raddr25 = c25_raddr;
assign gprf_raddr26 = c26_raddr;
assign gprf_raddr27 = c27_raddr;
assign gprf_raddr28 = c28_raddr;
assign gprf_raddr29 = c29_raddr;
assign gprf_raddr30 = c30_raddr;
assign gprf_raddr31 = c31_raddr;

assign gprf_waddr0 = (state == ST_LOAD_STREAM) ? load_addr_pipe1 : c0_waddr;
assign gprf_wdata0 = (state == ST_LOAD_STREAM) ? load_data_pipe1_a : c0_wdata;
assign gprf_we0    = (state == ST_LOAD_STREAM) ? load_write_valid  : c0_we;
assign gprf_waddr1 = (state == ST_LOAD_STREAM) ? (load_addr_pipe1 + 6'd1) : c1_waddr;
assign gprf_wdata1 = (state == ST_LOAD_STREAM) ? load_data_pipe1_b          : c1_wdata;
assign gprf_we1    = (state == ST_LOAD_STREAM) ? load_write_valid          : c1_we;
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
assign gprf_waddr16 = c16_waddr;
assign gprf_wdata16 = c16_wdata;
assign gprf_we16    = c16_we;
assign gprf_waddr17 = c17_waddr;
assign gprf_wdata17 = c17_wdata;
assign gprf_we17    = c17_we;
assign gprf_waddr18 = c18_waddr;
assign gprf_wdata18 = c18_wdata;
assign gprf_we18    = c18_we;
assign gprf_waddr19 = c19_waddr;
assign gprf_wdata19 = c19_wdata;
assign gprf_we19    = c19_we;
assign gprf_waddr20 = c20_waddr;
assign gprf_wdata20 = c20_wdata;
assign gprf_we20    = c20_we;
assign gprf_waddr21 = c21_waddr;
assign gprf_wdata21 = c21_wdata;
assign gprf_we21    = c21_we;
assign gprf_waddr22 = c22_waddr;
assign gprf_wdata22 = c22_wdata;
assign gprf_we22    = c22_we;
assign gprf_waddr23 = c23_waddr;
assign gprf_wdata23 = c23_wdata;
assign gprf_we23    = c23_we;
assign gprf_waddr24 = c24_waddr;
assign gprf_wdata24 = c24_wdata;
assign gprf_we24    = c24_we;
assign gprf_waddr25 = c25_waddr;
assign gprf_wdata25 = c25_wdata;
assign gprf_we25    = c25_we;
assign gprf_waddr26 = c26_waddr;
assign gprf_wdata26 = c26_wdata;
assign gprf_we26    = c26_we;
assign gprf_waddr27 = c27_waddr;
assign gprf_wdata27 = c27_wdata;
assign gprf_we27    = c27_we;
assign gprf_waddr28 = c28_waddr;
assign gprf_wdata28 = c28_wdata;
assign gprf_we28    = c28_we;
assign gprf_waddr29 = c29_waddr;
assign gprf_wdata29 = c29_wdata;
assign gprf_we29    = c29_we;
assign gprf_waddr30 = c30_waddr;
assign gprf_wdata30 = c30_wdata;
assign gprf_we30    = c30_we;
assign gprf_waddr31 = c31_waddr;
assign gprf_wdata31 = c31_wdata;
assign gprf_we31    = c31_we;

global_rf_32w32r u_global_rf (
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
    .raddr16(gprf_raddr16), .rdata16(gprf_rdata16),
    .raddr17(gprf_raddr17), .rdata17(gprf_rdata17),
    .raddr18(gprf_raddr18), .rdata18(gprf_rdata18),
    .raddr19(gprf_raddr19), .rdata19(gprf_rdata19),
    .raddr20(gprf_raddr20), .rdata20(gprf_rdata20),
    .raddr21(gprf_raddr21), .rdata21(gprf_rdata21),
    .raddr22(gprf_raddr22), .rdata22(gprf_rdata22),
    .raddr23(gprf_raddr23), .rdata23(gprf_rdata23),
    .raddr24(gprf_raddr24), .rdata24(gprf_rdata24),
    .raddr25(gprf_raddr25), .rdata25(gprf_rdata25),
    .raddr26(gprf_raddr26), .rdata26(gprf_rdata26),
    .raddr27(gprf_raddr27), .rdata27(gprf_rdata27),
    .raddr28(gprf_raddr28), .rdata28(gprf_rdata28),
    .raddr29(gprf_raddr29), .rdata29(gprf_rdata29),
    .raddr30(gprf_raddr30), .rdata30(gprf_rdata30),
    .raddr31(gprf_raddr31), .rdata31(gprf_rdata31),
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
    .waddr15(gprf_waddr15), .wdata15(gprf_wdata15), .we15(gprf_we15),
    .waddr16(gprf_waddr16), .wdata16(gprf_wdata16), .we16(gprf_we16),
    .waddr17(gprf_waddr17), .wdata17(gprf_wdata17), .we17(gprf_we17),
    .waddr18(gprf_waddr18), .wdata18(gprf_wdata18), .we18(gprf_we18),
    .waddr19(gprf_waddr19), .wdata19(gprf_wdata19), .we19(gprf_we19),
    .waddr20(gprf_waddr20), .wdata20(gprf_wdata20), .we20(gprf_we20),
    .waddr21(gprf_waddr21), .wdata21(gprf_wdata21), .we21(gprf_we21),
    .waddr22(gprf_waddr22), .wdata22(gprf_wdata22), .we22(gprf_we22),
    .waddr23(gprf_waddr23), .wdata23(gprf_wdata23), .we23(gprf_we23),
    .waddr24(gprf_waddr24), .wdata24(gprf_wdata24), .we24(gprf_we24),
    .waddr25(gprf_waddr25), .wdata25(gprf_wdata25), .we25(gprf_we25),
    .waddr26(gprf_waddr26), .wdata26(gprf_wdata26), .we26(gprf_we26),
    .waddr27(gprf_waddr27), .wdata27(gprf_wdata27), .we27(gprf_we27),
    .waddr28(gprf_waddr28), .wdata28(gprf_wdata28), .we28(gprf_we28),
    .waddr29(gprf_waddr29), .wdata29(gprf_wdata29), .we29(gprf_we29),
    .waddr30(gprf_waddr30), .wdata30(gprf_wdata30), .we30(gprf_we30),
    .waddr31(gprf_waddr31), .wdata31(gprf_wdata31), .we31(gprf_we31)
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
wire [31:0] debug_pc16;
wire [31:0] debug_pc17;
wire [31:0] debug_pc18;
wire [31:0] debug_pc19;
wire [31:0] debug_pc20;
wire [31:0] debug_pc21;
wire [31:0] debug_pc22;
wire [31:0] debug_pc23;
wire [31:0] debug_pc24;
wire [31:0] debug_pc25;
wire [31:0] debug_pc26;
wire [31:0] debug_pc27;
wire [31:0] debug_pc28;
wire [31:0] debug_pc29;
wire [31:0] debug_pc30;
wire [31:0] debug_pc31;
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
wire        core_done16;
wire        core_done17;
wire        core_done18;
wire        core_done19;
wire        core_done20;
wire        core_done21;
wire        core_done22;
wire        core_done23;
wire        core_done24;
wire        core_done25;
wire        core_done26;
wire        core_done27;
wire        core_done28;
wire        core_done29;
wire        core_done30;
wire        core_done31;

mcu_top #(.CORE_ID(0), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_00.hex"), .DONE_PC(DONE_PC_CORE00)) u_core0 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c0_raddr), .gprf_rdata(gprf_rdata0),
    .gprf_waddr(c0_waddr), .gprf_wdata(c0_wdata), .gprf_we(c0_we),
    .debug_pc(debug_pc0), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done0)
);

mcu_top #(.CORE_ID(1), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_01.hex"), .DONE_PC(DONE_PC_CORE01)) u_core1 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c1_raddr), .gprf_rdata(gprf_rdata1),
    .gprf_waddr(c1_waddr), .gprf_wdata(c1_wdata), .gprf_we(c1_we),
    .debug_pc(debug_pc1), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done1)
);

mcu_top #(.CORE_ID(2), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_02.hex"), .DONE_PC(DONE_PC_CORE02)) u_core2 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c2_raddr), .gprf_rdata(gprf_rdata2),
    .gprf_waddr(c2_waddr), .gprf_wdata(c2_wdata), .gprf_we(c2_we),
    .debug_pc(debug_pc2), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done2)
);

mcu_top #(.CORE_ID(3), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_03.hex"), .DONE_PC(DONE_PC_CORE03)) u_core3 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c3_raddr), .gprf_rdata(gprf_rdata3),
    .gprf_waddr(c3_waddr), .gprf_wdata(c3_wdata), .gprf_we(c3_we),
    .debug_pc(debug_pc3), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done3)
);

mcu_top #(.CORE_ID(4), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_04.hex"), .DONE_PC(DONE_PC_CORE04)) u_core4 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c4_raddr), .gprf_rdata(gprf_rdata4),
    .gprf_waddr(c4_waddr), .gprf_wdata(c4_wdata), .gprf_we(c4_we),
    .debug_pc(debug_pc4), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done4)
);

mcu_top #(.CORE_ID(5), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_05.hex"), .DONE_PC(DONE_PC_CORE05)) u_core5 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c5_raddr), .gprf_rdata(gprf_rdata5),
    .gprf_waddr(c5_waddr), .gprf_wdata(c5_wdata), .gprf_we(c5_we),
    .debug_pc(debug_pc5), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done5)
);

mcu_top #(.CORE_ID(6), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_06.hex"), .DONE_PC(DONE_PC_CORE06)) u_core6 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c6_raddr), .gprf_rdata(gprf_rdata6),
    .gprf_waddr(c6_waddr), .gprf_wdata(c6_wdata), .gprf_we(c6_we),
    .debug_pc(debug_pc6), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done6)
);

mcu_top #(.CORE_ID(7), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_07.hex"), .DONE_PC(DONE_PC_CORE07)) u_core7 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c7_raddr), .gprf_rdata(gprf_rdata7),
    .gprf_waddr(c7_waddr), .gprf_wdata(c7_wdata), .gprf_we(c7_we),
    .debug_pc(debug_pc7), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done7)
);

mcu_top #(.CORE_ID(8), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_08.hex"), .DONE_PC(DONE_PC_CORE08)) u_core8 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c8_raddr), .gprf_rdata(gprf_rdata8),
    .gprf_waddr(c8_waddr), .gprf_wdata(c8_wdata), .gprf_we(c8_we),
    .debug_pc(debug_pc8), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done8)
);

mcu_top #(.CORE_ID(9), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_09.hex"), .DONE_PC(DONE_PC_CORE09)) u_core9 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c9_raddr), .gprf_rdata(gprf_rdata9),
    .gprf_waddr(c9_waddr), .gprf_wdata(c9_wdata), .gprf_we(c9_we),
    .debug_pc(debug_pc9), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done9)
);

mcu_top #(.CORE_ID(10), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_10.hex"), .DONE_PC(DONE_PC_CORE10)) u_core10 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c10_raddr), .gprf_rdata(gprf_rdata10),
    .gprf_waddr(c10_waddr), .gprf_wdata(c10_wdata), .gprf_we(c10_we),
    .debug_pc(debug_pc10), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done10)
);

mcu_top #(.CORE_ID(11), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_11.hex"), .DONE_PC(DONE_PC_CORE11)) u_core11 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c11_raddr), .gprf_rdata(gprf_rdata11),
    .gprf_waddr(c11_waddr), .gprf_wdata(c11_wdata), .gprf_we(c11_we),
    .debug_pc(debug_pc11), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done11)
);

mcu_top #(.CORE_ID(12), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_12.hex"), .DONE_PC(DONE_PC_CORE12)) u_core12 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c12_raddr), .gprf_rdata(gprf_rdata12),
    .gprf_waddr(c12_waddr), .gprf_wdata(c12_wdata), .gprf_we(c12_we),
    .debug_pc(debug_pc12), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done12)
);

mcu_top #(.CORE_ID(13), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_13.hex"), .DONE_PC(DONE_PC_CORE13)) u_core13 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c13_raddr), .gprf_rdata(gprf_rdata13),
    .gprf_waddr(c13_waddr), .gprf_wdata(c13_wdata), .gprf_we(c13_we),
    .debug_pc(debug_pc13), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done13)
);

mcu_top #(.CORE_ID(14), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_14.hex"), .DONE_PC(DONE_PC_CORE14)) u_core14 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c14_raddr), .gprf_rdata(gprf_rdata14),
    .gprf_waddr(c14_waddr), .gprf_wdata(c14_wdata), .gprf_we(c14_we),
    .debug_pc(debug_pc14), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done14)
);

mcu_top #(.CORE_ID(15), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_15.hex"), .DONE_PC(DONE_PC_CORE15)) u_core15 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c15_raddr), .gprf_rdata(gprf_rdata15),
    .gprf_waddr(c15_waddr), .gprf_wdata(c15_wdata), .gprf_we(c15_we),
    .debug_pc(debug_pc15), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done15)
);

mcu_top #(.CORE_ID(16), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_16.hex"), .DONE_PC(DONE_PC_CORE16)) u_core16 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c16_raddr), .gprf_rdata(gprf_rdata16),
    .gprf_waddr(c16_waddr), .gprf_wdata(c16_wdata), .gprf_we(c16_we),
    .debug_pc(debug_pc16), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done16)
);

mcu_top #(.CORE_ID(17), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_17.hex"), .DONE_PC(DONE_PC_CORE17)) u_core17 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c17_raddr), .gprf_rdata(gprf_rdata17),
    .gprf_waddr(c17_waddr), .gprf_wdata(c17_wdata), .gprf_we(c17_we),
    .debug_pc(debug_pc17), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done17)
);

mcu_top #(.CORE_ID(18), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_18.hex"), .DONE_PC(DONE_PC_CORE18)) u_core18 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c18_raddr), .gprf_rdata(gprf_rdata18),
    .gprf_waddr(c18_waddr), .gprf_wdata(c18_wdata), .gprf_we(c18_we),
    .debug_pc(debug_pc18), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done18)
);

mcu_top #(.CORE_ID(19), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_19.hex"), .DONE_PC(DONE_PC_CORE19)) u_core19 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c19_raddr), .gprf_rdata(gprf_rdata19),
    .gprf_waddr(c19_waddr), .gprf_wdata(c19_wdata), .gprf_we(c19_we),
    .debug_pc(debug_pc19), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done19)
);

mcu_top #(.CORE_ID(20), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_20.hex"), .DONE_PC(DONE_PC_CORE20)) u_core20 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c20_raddr), .gprf_rdata(gprf_rdata20),
    .gprf_waddr(c20_waddr), .gprf_wdata(c20_wdata), .gprf_we(c20_we),
    .debug_pc(debug_pc20), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done20)
);

mcu_top #(.CORE_ID(21), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_21.hex"), .DONE_PC(DONE_PC_CORE21)) u_core21 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c21_raddr), .gprf_rdata(gprf_rdata21),
    .gprf_waddr(c21_waddr), .gprf_wdata(c21_wdata), .gprf_we(c21_we),
    .debug_pc(debug_pc21), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done21)
);

mcu_top #(.CORE_ID(22), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_22.hex"), .DONE_PC(DONE_PC_CORE22)) u_core22 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c22_raddr), .gprf_rdata(gprf_rdata22),
    .gprf_waddr(c22_waddr), .gprf_wdata(c22_wdata), .gprf_we(c22_we),
    .debug_pc(debug_pc22), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done22)
);

mcu_top #(.CORE_ID(23), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_23.hex"), .DONE_PC(DONE_PC_CORE23)) u_core23 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c23_raddr), .gprf_rdata(gprf_rdata23),
    .gprf_waddr(c23_waddr), .gprf_wdata(c23_wdata), .gprf_we(c23_we),
    .debug_pc(debug_pc23), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done23)
);

mcu_top #(.CORE_ID(24), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_24.hex"), .DONE_PC(DONE_PC_CORE24)) u_core24 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c24_raddr), .gprf_rdata(gprf_rdata24),
    .gprf_waddr(c24_waddr), .gprf_wdata(c24_wdata), .gprf_we(c24_we),
    .debug_pc(debug_pc24), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done24)
);

mcu_top #(.CORE_ID(25), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_25.hex"), .DONE_PC(DONE_PC_CORE25)) u_core25 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c25_raddr), .gprf_rdata(gprf_rdata25),
    .gprf_waddr(c25_waddr), .gprf_wdata(c25_wdata), .gprf_we(c25_we),
    .debug_pc(debug_pc25), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done25)
);

mcu_top #(.CORE_ID(26), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_26.hex"), .DONE_PC(DONE_PC_CORE26)) u_core26 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c26_raddr), .gprf_rdata(gprf_rdata26),
    .gprf_waddr(c26_waddr), .gprf_wdata(c26_wdata), .gprf_we(c26_we),
    .debug_pc(debug_pc26), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done26)
);

mcu_top #(.CORE_ID(27), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_27.hex"), .DONE_PC(DONE_PC_CORE27)) u_core27 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c27_raddr), .gprf_rdata(gprf_rdata27),
    .gprf_waddr(c27_waddr), .gprf_wdata(c27_wdata), .gprf_we(c27_we),
    .debug_pc(debug_pc27), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done27)
);

mcu_top #(.CORE_ID(28), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_28.hex"), .DONE_PC(DONE_PC_CORE28)) u_core28 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c28_raddr), .gprf_rdata(gprf_rdata28),
    .gprf_waddr(c28_waddr), .gprf_wdata(c28_wdata), .gprf_we(c28_we),
    .debug_pc(debug_pc28), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done28)
);

mcu_top #(.CORE_ID(29), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_29.hex"), .DONE_PC(DONE_PC_CORE29)) u_core29 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c29_raddr), .gprf_rdata(gprf_rdata29),
    .gprf_waddr(c29_waddr), .gprf_wdata(c29_wdata), .gprf_we(c29_we),
    .debug_pc(debug_pc29), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done29)
);

mcu_top #(.CORE_ID(30), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_30.hex"), .DONE_PC(DONE_PC_CORE30)) u_core30 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c30_raddr), .gprf_rdata(gprf_rdata30),
    .gprf_waddr(c30_waddr), .gprf_wdata(c30_wdata), .gprf_we(c30_we),
    .debug_pc(debug_pc30), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done30)
);

mcu_top #(.CORE_ID(31), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("f:/FPGA/shudianshiyan/src/pym/mcu_v6/programs/core_31.hex"), .DONE_PC(DONE_PC_CORE31)) u_core31 (
    .clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable),
    .gprf_raddr(c31_raddr), .gprf_rdata(gprf_rdata31),
    .gprf_waddr(c31_waddr), .gprf_wdata(c31_wdata), .gprf_we(c31_we),
    .debug_pc(debug_pc31), .debug_instr(), .debug_alu_result(),
    .debug_mem_wdata(), .debug_mem_addr(),
    .debug_reg_wdata(), .debug_reg_waddr(),
    .debug_reg_write(), .debug_mem_write(),
    .debug_flags(), .debug_unsupported(), .core_done(core_done31)
);

wire all_cores_done = core_done0 && core_done1 && core_done2 && core_done3 && core_done4 && core_done5 && core_done6 && core_done7 && core_done8 && core_done9 && core_done10 && core_done11 && core_done12 && core_done13 && core_done14 && core_done15 && core_done16 && core_done17 && core_done18 && core_done19 && core_done20 && core_done21 && core_done22 && core_done23 && core_done24 && core_done25 && core_done26 && core_done27 && core_done28 && core_done29 && core_done30 && core_done31;
wire done = (state == ST_DONE);

reg  start_flag, stop_flag;
wire [19:0] cnt_test;
cnt_test u_cnt_test (.clk(clk), .rst_n(rst_n), .start_flag(start_flag), .stop_flag(stop_flag), .cnt_test(cnt_test));

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= ST_IDLE; load_index <= 6'd0;
        load_addr_pipe0 <= 6'd0; load_valid_pipe0 <= 1'b0;
        load_addr_pipe1 <= 6'd0; load_valid_pipe1 <= 1'b0;
        load_data_pipe1_a <= 16'd0; load_data_pipe1_b <= 16'd0;
        load_all_issued <= 1'b0; load_write_done <= 1'b0;
        write_index <= 6'd0; start_flag <= 1'b0; stop_flag <= 1'b0;
    end else begin
        start_flag <= 1'b0; stop_flag <= 1'b0;
        case (state)
            ST_IDLE: begin
                load_index <= 6'd0; load_addr_pipe0 <= 6'd0; load_valid_pipe0 <= 1'b0;
                load_addr_pipe1 <= 6'd0; load_valid_pipe1 <= 1'b0;
                load_data_pipe1_a <= 16'd0; load_data_pipe1_b <= 16'd0;
                load_all_issued <= 1'b0; load_write_done <= 1'b0; write_index <= 6'd0;
                state <= ST_LOAD_STREAM; start_flag <= 1'b1;
            end
            ST_LOAD_STREAM: begin
                load_addr_pipe0  <= load_index; load_valid_pipe0 <= load_can_issue;
                load_addr_pipe1  <= load_addr_pipe0; load_valid_pipe1 <= load_valid_pipe0;
                load_data_pipe1_a <= test_vector_in_a;
                load_data_pipe1_b <= test_vector_in_b;
                if (load_can_issue) begin
                    if (load_index == LAST_PAIR_BASE) load_all_issued <= 1'b1;
                    else load_index <= load_index + 6'd2;
                end
                if (load_write_valid && (load_addr_pipe1 == LAST_PAIR_BASE)) load_write_done <= 1'b1;
                if (load_all_issued && load_write_done) begin
                    load_index <= 6'd0; load_valid_pipe0 <= 1'b0; load_valid_pipe1 <= 1'b0;
                    load_data_pipe1_a <= 16'd0; load_data_pipe1_b <= 16'd0;
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