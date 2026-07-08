//============================================================

// Module: top (V4.0 8-Core)

// Description:

//   V4.0 8-core heterogeneous sorting top-level wrapper.

//

//   Architecture:

//     +--------------------------------------------------+

//     |                    top.v                          |

//     |  +---------+          star interconnect  +-----+ |

//     |  | core_0  |--rw------------------------>|     | |

//     |  | ...     |--rw------------------------>|grf  | |

//     |  | core_7  |--rw------------------------>|8w8r | |

//     |  +---------+                             +-----+ |

//     |  test_ROM --> load pipeline --> global_rf        |

//     |  global_rf --> write FSM --> verify_RAM          |

//     +--------------------------------------------------+

//

//   V4.0 key changes vs V3.5:

//     1. 8 cores, each sorts 8 elements (64 total).

//     2. global_rf_8w8r: 8R/8W ports.

//     3. Star topology: each core hardwired to one read+write port.

//============================================================



`timescale 1ns/1ps



module top #(

    parameter INSTR_ROM_ADDR_WIDTH = 12,

    parameter N_DATA               = 64,

    parameter DONE_PC_CORE0        = 32'h000005A0,

    parameter DONE_PC_CORE1        = 32'h000005A0,

    parameter DONE_PC_CORE2        = 32'h000005A0,

    parameter DONE_PC_CORE3        = 32'h000005A0,

    parameter DONE_PC_CORE4        = 32'h000005A0,

    parameter DONE_PC_CORE5        = 32'h000005A0,

    parameter DONE_PC_CORE6        = 32'h000005A0,

    parameter DONE_PC_CORE7        = 32'h000005A0

)(

    input wire clk_osc,

    input wire rst

);



//============================================================

// Clock

//============================================================

wire clk;

sys_clk u_sys_clk (

    .clk_out1 (clk),

    .clk_in1  (clk_osc)

);



wire rst_n = ~rst;



//============================================================

// State machine

//============================================================

localparam ST_IDLE        = 3'd0;

localparam ST_LOAD_STREAM = 3'd1;

localparam ST_RUN         = 3'd5;

localparam ST_WRITE       = 3'd6;

localparam ST_DONE        = 3'd7;



reg [2:0] state;

reg [5:0] load_index;

reg [5:0] write_index;

localparam [5:0] LAST_INDEX = N_DATA - 1;



//============================================================

// Load pipeline

//============================================================

reg [5:0]  load_addr_pipe0;

reg        load_valid_pipe0;

reg [5:0]  load_addr_pipe1;

reg        load_valid_pipe1;

reg        load_all_issued;

reg        load_write_done;

wire       load_can_issue;

wire       load_write_valid;



assign load_can_issue   = (state == ST_LOAD_STREAM) && !load_all_issued;

assign load_write_valid = (state == ST_LOAD_STREAM) && load_valid_pipe1;



//============================================================

// test_ROM IP

//============================================================

wire        test_rom_en;

wire [5:0]  test_rom_addr;

wire [15:0] test_vector_in;



assign test_rom_en   = (state == ST_LOAD_STREAM) && !load_all_issued;

assign test_rom_addr = load_index;



test_ROM u_test_ROM (

    .clka  (clk),

    .ena   (test_rom_en),

    .addra (test_rom_addr),

    .douta (test_vector_in)

);



//============================================================

// verify_RAM IP

//============================================================

wire        verify_ram_en;

wire [0:0]  verify_ram_we;

wire [5:0]  verify_ram_addr;

wire [15:0] verify_vector_out;

wire [15:0] verify_ram_dout;



assign verify_ram_en     = (state == ST_WRITE);

assign verify_ram_we     = (state == ST_WRITE) ? 1'b1 : 1'b0;

assign verify_ram_addr   = write_index;

assign verify_vector_out = gprf_rdata0;



verify_RAM u_verify_RAM (

    .clka  (clk),

    .ena   (verify_ram_en),

    .wea   (verify_ram_we),

    .addra (verify_ram_addr),

    .dina  (verify_vector_out),

    .douta (verify_ram_dout)

);



//============================================================

// Global Register File: 64x16-bit, 8-read / 8-write

//============================================================

wire [5:0]  gprf_raddr0, gprf_raddr1, gprf_raddr2, gprf_raddr3;

wire [5:0]  gprf_raddr4, gprf_raddr5, gprf_raddr6, gprf_raddr7;

wire [15:0] gprf_rdata0, gprf_rdata1, gprf_rdata2, gprf_rdata3;

wire [15:0] gprf_rdata4, gprf_rdata5, gprf_rdata6, gprf_rdata7;

wire [5:0]  gprf_waddr0, gprf_waddr1, gprf_waddr2, gprf_waddr3;

wire [5:0]  gprf_waddr4, gprf_waddr5, gprf_waddr6, gprf_waddr7;

wire [15:0] gprf_wdata0, gprf_wdata1, gprf_wdata2, gprf_wdata3;

wire [15:0] gprf_wdata4, gprf_wdata5, gprf_wdata6, gprf_wdata7;

wire        gprf_we0, gprf_we1, gprf_we2, gprf_we3;

wire        gprf_we4, gprf_we5, gprf_we6, gprf_we7;



// Per-core gprf signals

wire [5:0]  c0_raddr, c1_raddr, c2_raddr, c3_raddr;

wire [5:0]  c4_raddr, c5_raddr, c6_raddr, c7_raddr;

wire [15:0] c0_wdata, c1_wdata, c2_wdata, c3_wdata;

wire [15:0] c4_wdata, c5_wdata, c6_wdata, c7_wdata;

wire [5:0]  c0_waddr, c1_waddr, c2_waddr, c3_waddr;

wire [5:0]  c4_waddr, c5_waddr, c6_waddr, c7_waddr;

wire        c0_we, c1_we, c2_we, c3_we;

wire        c4_we, c5_we, c6_we, c7_we;



// ---- Star interconnect ----

assign gprf_raddr0 = (state == ST_WRITE) ? write_index : c0_raddr;

assign gprf_raddr1 = c1_raddr;

assign gprf_raddr2 = c2_raddr;

assign gprf_raddr3 = c3_raddr;

assign gprf_raddr4 = c4_raddr;

assign gprf_raddr5 = c5_raddr;

assign gprf_raddr6 = c6_raddr;

assign gprf_raddr7 = c7_raddr;



assign gprf_waddr0 = (state == ST_LOAD_STREAM) ? load_addr_pipe1 : c0_waddr;

assign gprf_wdata0 = (state == ST_LOAD_STREAM) ? test_vector_in   : c0_wdata;

assign gprf_we0    = (state == ST_LOAD_STREAM) ? load_write_valid  : c0_we;

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



global_rf_8w8r u_global_rf (

    .clk    (clk),

    .rst_n  (rst_n),

    .raddr0 (gprf_raddr0), .raddr1 (gprf_raddr1),

    .raddr2 (gprf_raddr2), .raddr3 (gprf_raddr3),

    .raddr4 (gprf_raddr4), .raddr5 (gprf_raddr5),

    .raddr6 (gprf_raddr6), .raddr7 (gprf_raddr7),

    .rdata0 (gprf_rdata0), .rdata1 (gprf_rdata1),

    .rdata2 (gprf_rdata2), .rdata3 (gprf_rdata3),

    .rdata4 (gprf_rdata4), .rdata5 (gprf_rdata5),

    .rdata6 (gprf_rdata6), .rdata7 (gprf_rdata7),

    .waddr0 (gprf_waddr0), .waddr1 (gprf_waddr1),

    .waddr2 (gprf_waddr2), .waddr3 (gprf_waddr3),

    .waddr4 (gprf_waddr4), .waddr5 (gprf_waddr5),

    .waddr6 (gprf_waddr6), .waddr7 (gprf_waddr7),

    .wdata0 (gprf_wdata0), .wdata1 (gprf_wdata1),

    .wdata2 (gprf_wdata2), .wdata3 (gprf_wdata3),

    .wdata4 (gprf_wdata4), .wdata5 (gprf_wdata5),

    .wdata6 (gprf_wdata6), .wdata7 (gprf_wdata7),

    .we0    (gprf_we0),    .we1    (gprf_we1),

    .we2    (gprf_we2),    .we3    (gprf_we3),

    .we4    (gprf_we4),    .we5    (gprf_we5),

    .we6    (gprf_we6),    .we7    (gprf_we7)

);



//============================================================

// MCU core control

//============================================================

wire mcu_rst;

assign mcu_rst = rst || (state != ST_RUN);



wire mcu_pc_enable;

assign mcu_pc_enable = (state == ST_RUN);



//============================================================

// 8x MCU Core instances

//============================================================

wire [31:0] debug_pc0, debug_pc1, debug_pc2, debug_pc3;

wire [31:0] debug_pc4, debug_pc5, debug_pc6, debug_pc7;

wire        core_done0, core_done1, core_done2, core_done3;

wire        core_done4, core_done5, core_done6, core_done7;



mcu_top #(.CORE_ID(0), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v4/programs/core_0.hex"), .DONE_PC(DONE_PC_CORE0)) u_core0 (.clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable), .gprf_raddr(c0_raddr), .gprf_rdata(gprf_rdata0), .gprf_waddr(c0_waddr), .gprf_wdata(c0_wdata), .gprf_we(c0_we), .debug_pc(debug_pc0), .debug_instr(), .debug_alu_result(), .debug_mem_wdata(), .debug_mem_addr(), .debug_reg_wdata(), .debug_reg_waddr(), .debug_reg_write(), .debug_mem_write(), .debug_flags(), .debug_unsupported(), .core_done(core_done0));

mcu_top #(.CORE_ID(1), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v4/programs/core_1.hex"), .DONE_PC(DONE_PC_CORE1)) u_core1 (.clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable), .gprf_raddr(c1_raddr), .gprf_rdata(gprf_rdata1), .gprf_waddr(c1_waddr), .gprf_wdata(c1_wdata), .gprf_we(c1_we), .debug_pc(debug_pc1), .debug_instr(), .debug_alu_result(), .debug_mem_wdata(), .debug_mem_addr(), .debug_reg_wdata(), .debug_reg_waddr(), .debug_reg_write(), .debug_mem_write(), .debug_flags(), .debug_unsupported(), .core_done(core_done1));

mcu_top #(.CORE_ID(2), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v4/programs/core_2.hex"), .DONE_PC(DONE_PC_CORE2)) u_core2 (.clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable), .gprf_raddr(c2_raddr), .gprf_rdata(gprf_rdata2), .gprf_waddr(c2_waddr), .gprf_wdata(c2_wdata), .gprf_we(c2_we), .debug_pc(debug_pc2), .debug_instr(), .debug_alu_result(), .debug_mem_wdata(), .debug_mem_addr(), .debug_reg_wdata(), .debug_reg_waddr(), .debug_reg_write(), .debug_mem_write(), .debug_flags(), .debug_unsupported(), .core_done(core_done2));

mcu_top #(.CORE_ID(3), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v4/programs/core_3.hex"), .DONE_PC(DONE_PC_CORE3)) u_core3 (.clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable), .gprf_raddr(c3_raddr), .gprf_rdata(gprf_rdata3), .gprf_waddr(c3_waddr), .gprf_wdata(c3_wdata), .gprf_we(c3_we), .debug_pc(debug_pc3), .debug_instr(), .debug_alu_result(), .debug_mem_wdata(), .debug_mem_addr(), .debug_reg_wdata(), .debug_reg_waddr(), .debug_reg_write(), .debug_mem_write(), .debug_flags(), .debug_unsupported(), .core_done(core_done3));

mcu_top #(.CORE_ID(4), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v4/programs/core_4.hex"), .DONE_PC(DONE_PC_CORE4)) u_core4 (.clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable), .gprf_raddr(c4_raddr), .gprf_rdata(gprf_rdata4), .gprf_waddr(c4_waddr), .gprf_wdata(c4_wdata), .gprf_we(c4_we), .debug_pc(debug_pc4), .debug_instr(), .debug_alu_result(), .debug_mem_wdata(), .debug_mem_addr(), .debug_reg_wdata(), .debug_reg_waddr(), .debug_reg_write(), .debug_mem_write(), .debug_flags(), .debug_unsupported(), .core_done(core_done4));

mcu_top #(.CORE_ID(5), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v4/programs/core_5.hex"), .DONE_PC(DONE_PC_CORE5)) u_core5 (.clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable), .gprf_raddr(c5_raddr), .gprf_rdata(gprf_rdata5), .gprf_waddr(c5_waddr), .gprf_wdata(c5_wdata), .gprf_we(c5_we), .debug_pc(debug_pc5), .debug_instr(), .debug_alu_result(), .debug_mem_wdata(), .debug_mem_addr(), .debug_reg_wdata(), .debug_reg_waddr(), .debug_reg_write(), .debug_mem_write(), .debug_flags(), .debug_unsupported(), .core_done(core_done5));

mcu_top #(.CORE_ID(6), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v4/programs/core_6.hex"), .DONE_PC(DONE_PC_CORE6)) u_core6 (.clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable), .gprf_raddr(c6_raddr), .gprf_rdata(gprf_rdata6), .gprf_waddr(c6_waddr), .gprf_wdata(c6_wdata), .gprf_we(c6_we), .debug_pc(debug_pc6), .debug_instr(), .debug_alu_result(), .debug_mem_wdata(), .debug_mem_addr(), .debug_reg_wdata(), .debug_reg_waddr(), .debug_reg_write(), .debug_mem_write(), .debug_flags(), .debug_unsupported(), .core_done(core_done6));

mcu_top #(.CORE_ID(7), .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH), .PROGRAM_FILE("F:/FPGA/shudianshiyan/src/pym/mcu_v4/programs/core_7.hex"), .DONE_PC(DONE_PC_CORE7)) u_core7 (.clk(clk), .rst(mcu_rst), .pc_enable(mcu_pc_enable), .gprf_raddr(c7_raddr), .gprf_rdata(gprf_rdata7), .gprf_waddr(c7_waddr), .gprf_wdata(c7_wdata), .gprf_we(c7_we), .debug_pc(debug_pc7), .debug_instr(), .debug_alu_result(), .debug_mem_wdata(), .debug_mem_addr(), .debug_reg_wdata(), .debug_reg_waddr(), .debug_reg_write(), .debug_mem_write(), .debug_flags(), .debug_unsupported(), .core_done(core_done7));



//============================================================

// Global DONE (8-way AND)

//============================================================

wire all_cores_done;

assign all_cores_done = core_done0 && core_done1 && core_done2 && core_done3

                     && core_done4 && core_done5 && core_done6 && core_done7;

wire done;

assign done = (state == ST_DONE);



//============================================================

// Cycle counter

//============================================================

reg  start_flag;

reg  stop_flag;

wire [19:0] cnt_test;



cnt_test u_cnt_test (

    .clk(clk), .rst_n(rst_n),

    .start_flag(start_flag), .stop_flag(stop_flag),

    .cnt_test(cnt_test)

);



//============================================================

// FSM sequential logic

//============================================================

always @(posedge clk or posedge rst) begin

    if (rst) begin

        state <= ST_IDLE;

        load_index <= 6'd0;

        load_addr_pipe0 <= 6'd0;

        load_valid_pipe0 <= 1'b0;

        load_addr_pipe1 <= 6'd0;

        load_valid_pipe1 <= 1'b0;

        load_all_issued <= 1'b0;

        load_write_done <= 1'b0;

        write_index <= 6'd0;

        start_flag <= 1'b0;

        stop_flag <= 1'b0;

    end else begin

        start_flag <= 1'b0;

        stop_flag <= 1'b0;



        case (state)

            ST_IDLE: begin

                load_index <= 6'd0;

                load_addr_pipe0 <= 6'd0;

                load_valid_pipe0 <= 1'b0;

                load_addr_pipe1 <= 6'd0;

                load_valid_pipe1 <= 1'b0;

                load_all_issued <= 1'b0;

                load_write_done <= 1'b0;

                write_index <= 6'd0;

                state <= ST_LOAD_STREAM;

                start_flag <= 1'b1;

            end



            ST_LOAD_STREAM: begin

                load_addr_pipe0 <= load_index;

                load_valid_pipe0 <= load_can_issue;

                load_addr_pipe1 <= load_addr_pipe0;

                load_valid_pipe1 <= load_valid_pipe0;

                if (load_can_issue) begin

                    if (load_index == LAST_INDEX)

                        load_all_issued <= 1'b1;

                    else

                        load_index <= load_index + 6'd1;

                end

                if (load_write_valid && (load_addr_pipe1 == LAST_INDEX))

                    load_write_done <= 1'b1;

                if (load_all_issued && load_write_done) begin

                    load_index <= 6'd0;

                    load_valid_pipe0 <= 1'b0;

                    load_valid_pipe1 <= 1'b0;

                    state <= ST_RUN;

                end

            end



            ST_RUN: begin

                if (all_cores_done) begin

                    write_index <= 6'd0;

                    state <= ST_WRITE;

                end

            end



            ST_WRITE: begin

                if (write_index == LAST_INDEX) begin

                    stop_flag <= 1'b1;

                    state <= ST_DONE;

                end else begin

                    write_index <= write_index + 6'd1;

                end

            end



            ST_DONE: state <= ST_DONE;

            default: state <= ST_IDLE;

        endcase

    end

end



//============================================================

// ILA

//============================================================

ila_0 u_ila (

    .clk(clk),

    .probe0(test_vector_in),

    .probe1(verify_vector_out),

    .probe2(cnt_test),

    .probe3(state),

    .probe4(debug_pc0)

);



endmodule // top