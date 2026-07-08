//============================================================
// ???????? (V3.6_DualPort_Load):
// 1. ?????: sys_clk ???????rst_n ?????????
// 2. ??? (FSM): 
//    - ST_IDLE: ???
//    - ST_LOAD_STREAM: 2???????????????? ROM 
//      ??? RF ? Port 0?Port 1?????? 2 ????
//    - ST_RUN: 4? MCU ???????
//    - ST_WRITE: ??? RF ?????? verify_RAM?
//    - ST_DONE: ????? stop_flag?
// 3. ???????:
//    - test_ROM: ?????? (Port A & Port B)???????
//    - global_rf_4w4r: ???????? ST_LOAD_STREAM ??
//      ?? Port 0 ? Port 1 ???????? ST_RUN ????? 4??
//    - verify_RAM: ?????????
// 4. MCU ?????: 4 ?????????????
//============================================================

`timescale 1ns/1ps

module top #(
    parameter INSTR_ROM_ADDR_WIDTH = 12,
    parameter N_DATA               = 64,
    parameter DONE_PC_CORE0        = 32'h00000AC8, 
    parameter DONE_PC_CORE1        = 32'h00000AC8,
    parameter DONE_PC_CORE2        = 32'h00000AC8,
    parameter DONE_PC_CORE3        = 32'h00000AC8
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
// Load pipeline: absorbs test_ROM BRAM 2-cycle read latency
//   pipe0 = address issued to test_ROM
//   pipe1 = data valid, write to global_rf (synchronous)
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
// test_ROM IP (Dual Port Configured)
//============================================================
wire        test_rom_en;
wire [5:0]  test_rom_addr;
wire [15:0] test_vector_in;

wire        test_rom_enb;
wire [5:0]  test_rom_addrb;
wire [15:0] test_vector_in_b;

assign test_rom_en    = (state == ST_LOAD_STREAM) && !load_all_issued;
assign test_rom_addr  = load_index;
assign test_rom_enb   = (state == ST_LOAD_STREAM) && !load_all_issued;
assign test_rom_addrb = load_index + 6'd1;

test_ROM u_test_ROM (
    .clka  (clk),
    .ena   (test_rom_en),
    .addra (test_rom_addr),
    .douta (test_vector_in),
    .clkb  (clk),
    .enb   (test_rom_enb),
    .addrb (test_rom_addrb),
    .doutb (test_vector_in_b)
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
// Global Register File: 64×16-bit, 4-read / 4-write
//============================================================
wire [5:0]  gprf_raddr0, gprf_raddr1, gprf_raddr2, gprf_raddr3;
wire [15:0] gprf_rdata0, gprf_rdata1, gprf_rdata2, gprf_rdata3;
wire [5:0]  gprf_waddr0, gprf_waddr1, gprf_waddr2, gprf_waddr3;
wire [15:0] gprf_wdata0, gprf_wdata1, gprf_wdata2, gprf_wdata3;
wire        gprf_we0,    gprf_we1,    gprf_we2,    gprf_we3;

// Per-core global_rf signals
wire [5:0]  c0_raddr, c1_raddr, c2_raddr, c3_raddr;
wire [15:0] c0_wdata, c1_wdata, c2_wdata, c3_wdata;
wire [5:0]  c0_waddr, c1_waddr, c2_waddr, c3_waddr;
wire        c0_we,    c1_we,    c2_we,    c3_we;

// ---- Star interconnect with port-0 and port-1 mux for load/writeback ----
// Read port 0: core_0 during ST_RUN; writeback FSM during ST_WRITE
assign gprf_raddr0 = (state == ST_WRITE) ? write_index : c0_raddr;
assign gprf_raddr1 = c1_raddr;
assign gprf_raddr2 = c2_raddr;
assign gprf_raddr3 = c3_raddr;

// Write port 0: core_0 during ST_RUN; load FSM (Even Address) during ST_LOAD_STREAM
assign gprf_waddr0 = (state == ST_LOAD_STREAM) ? load_addr_pipe1 : c0_waddr;
assign gprf_wdata0 = (state == ST_LOAD_STREAM) ? test_vector_in  : c0_wdata;
assign gprf_we0    = (state == ST_LOAD_STREAM) ? load_write_valid : c0_we;

// Write port 1: core_1 during ST_RUN; load FSM (Odd Address) during ST_LOAD_STREAM
assign gprf_waddr1 = (state == ST_LOAD_STREAM) ? (load_addr_pipe1 + 6'd1) : c1_waddr;
assign gprf_wdata1 = (state == ST_LOAD_STREAM) ? test_vector_in_b         : c1_wdata;
assign gprf_we1    = (state == ST_LOAD_STREAM) ? load_write_valid         : c1_we;

// Write port 2 & 3: dedicated to core_2 and core_3
assign gprf_waddr2 = c2_waddr;
assign gprf_wdata2 = c2_wdata;
assign gprf_we2    = c2_we;
assign gprf_waddr3 = c3_waddr;
assign gprf_wdata3 = c3_wdata;
assign gprf_we3    = c3_we;

global_rf_4w4r u_global_rf (
    .clk    (clk),
    .rst_n  (rst_n),
    .raddr0 (gprf_raddr0), .raddr1 (gprf_raddr1),
    .raddr2 (gprf_raddr2), .raddr3 (gprf_raddr3),
    .rdata0 (gprf_rdata0), .rdata1 (gprf_rdata1),
    .rdata2 (gprf_rdata2), .rdata3 (gprf_rdata3),
    .waddr0 (gprf_waddr0), .waddr1 (gprf_waddr1),
    .waddr2 (gprf_waddr2), .waddr3 (gprf_waddr3),
    .wdata0 (gprf_wdata0), .wdata1 (gprf_wdata1),
    .wdata2 (gprf_wdata2), .wdata3 (gprf_wdata3),
    .we0    (gprf_we0),    .we1    (gprf_we1),
    .we2    (gprf_we2),    .we3    (gprf_we3)
);

//============================================================
// MCU core control
//============================================================
wire mcu_rst;
assign mcu_rst = rst || (state != ST_RUN);

wire mcu_pc_enable;
assign mcu_pc_enable = (state == ST_RUN);

//============================================================
// 4× MCU Core instances
//============================================================
wire [31:0] debug_pc0,   debug_pc1,   debug_pc2,   debug_pc3;
wire [31:0] debug_instr0, debug_instr1, debug_instr2, debug_instr3;
wire [31:0] debug_alu0,   debug_alu1,   debug_alu2,   debug_alu3;
wire        core_done0,   core_done1,   core_done2,   core_done3;

mcu_top #(
    .CORE_ID             (0),
    .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH),
    .PROGRAM_FILE        ("F:/FPGA/shudianshiyan/src/pym/mcu_v3_5/programs/core_0.hex"),
    .DONE_PC             (DONE_PC_CORE0)
) u_core0 (
    .clk               (clk),
    .rst               (mcu_rst),
    .pc_enable         (mcu_pc_enable),
    .gprf_raddr        (c0_raddr),
    .gprf_rdata        (gprf_rdata0),
    .gprf_waddr        (c0_waddr),
    .gprf_wdata        (c0_wdata),
    .gprf_we           (c0_we),
    .debug_pc          (debug_pc0),
    .debug_instr       (debug_instr0),
    .debug_alu_result  (debug_alu0),
    .debug_mem_wdata   (),
    .debug_mem_addr    (),
    .debug_reg_wdata   (),
    .debug_reg_waddr   (),
    .debug_reg_write   (),
    .debug_mem_write   (),
    .debug_flags       (),
    .debug_unsupported (),
    .core_done         (core_done0)
);

mcu_top #(
    .CORE_ID             (1),
    .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH),
    .PROGRAM_FILE        ("F:/FPGA/shudianshiyan/src/pym/mcu_v3_5/programs/core_1.hex"),
    .DONE_PC             (DONE_PC_CORE1)
) u_core1 (
    .clk               (clk),
    .rst               (mcu_rst),
    .pc_enable         (mcu_pc_enable),
    .gprf_raddr        (c1_raddr),
    .gprf_rdata        (gprf_rdata1),
    .gprf_waddr        (c1_waddr),
    .gprf_wdata        (c1_wdata),
    .gprf_we           (c1_we),
    .debug_pc          (debug_pc1),
    .debug_instr       (debug_instr1),
    .debug_alu_result  (debug_alu1),
    .debug_mem_wdata   (),
    .debug_mem_addr    (),
    .debug_reg_wdata   (),
    .debug_reg_waddr   (),
    .debug_reg_write   (),
    .debug_mem_write   (),
    .debug_flags       (),
    .debug_unsupported (),
    .core_done         (core_done1)
);

mcu_top #(
    .CORE_ID             (2),
    .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH),
    .PROGRAM_FILE        ("F:/FPGA/shudianshiyan/src/pym/mcu_v3_5/programs/core_2.hex"),
    .DONE_PC             (DONE_PC_CORE2)
) u_core2 (
    .clk               (clk),
    .rst               (mcu_rst),
    .pc_enable         (mcu_pc_enable),
    .gprf_raddr        (c2_raddr),
    .gprf_rdata        (gprf_rdata2),
    .gprf_waddr        (c2_waddr),
    .gprf_wdata        (c2_wdata),
    .gprf_we           (c2_we),
    .debug_pc          (debug_pc2),
    .debug_instr       (debug_instr2),
    .debug_alu_result  (debug_alu2),
    .debug_mem_wdata   (),
    .debug_mem_addr    (),
    .debug_reg_wdata   (),
    .debug_reg_waddr   (),
    .debug_reg_write   (),
    .debug_mem_write   (),
    .debug_flags       (),
    .debug_unsupported (),
    .core_done         (core_done2)
);

mcu_top #(
    .CORE_ID             (3),
    .INSTR_ROM_ADDR_WIDTH(INSTR_ROM_ADDR_WIDTH),
    .PROGRAM_FILE        ("F:/FPGA/shudianshiyan/src/pym/mcu_v3_5/programs/core_3.hex"),
    .DONE_PC             (DONE_PC_CORE3)
) u_core3 (
    .clk               (clk),
    .rst               (mcu_rst),
    .pc_enable         (mcu_pc_enable),
    .gprf_raddr        (c3_raddr),
    .gprf_rdata        (gprf_rdata3),
    .gprf_waddr        (c3_waddr),
    .gprf_wdata        (c3_wdata),
    .gprf_we           (c3_we),
    .debug_pc          (debug_pc3),
    .debug_instr       (debug_instr3),
    .debug_alu_result  (debug_alu3),
    .debug_mem_wdata   (),
    .debug_mem_addr    (),
    .debug_reg_wdata   (),
    .debug_reg_waddr   (),
    .debug_reg_write   (),
    .debug_mem_write   (),
    .debug_flags       (),
    .debug_unsupported (),
    .core_done         (core_done3)
);

//============================================================
// Global DONE
//============================================================
wire all_cores_done;
assign all_cores_done = core_done0 && core_done1 && core_done2 && core_done3;
wire done;
assign done = (state == ST_DONE);

//============================================================
// Cycle counter
//============================================================
reg  start_flag;
reg  stop_flag;
wire [19:0] cnt_test;

cnt_test u_cnt_test (
    .clk        (clk),
    .rst_n      (rst_n),
    .start_flag (start_flag),
    .stop_flag  (stop_flag),
    .cnt_test   (cnt_test)
);

//============================================================
// FSM sequential logic
//============================================================
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state             <= ST_IDLE;
        load_index        <= 6'd0;
        load_addr_pipe0   <= 6'd0;
        load_valid_pipe0  <= 1'b0;
        load_addr_pipe1   <= 6'd0;
        load_valid_pipe1  <= 1'b0;
        load_all_issued   <= 1'b0;
        load_write_done   <= 1'b0;
        write_index       <= 6'd0;
        start_flag        <= 1'b0;
        stop_flag         <= 1'b0;
    end else begin
        start_flag <= 1'b0;
        stop_flag  <= 1'b0;

        case (state)
            ST_IDLE: begin
                load_index        <= 6'd0;
                load_addr_pipe0   <= 6'd0;
                load_valid_pipe0  <= 1'b0;
                load_addr_pipe1   <= 6'd0;
                load_valid_pipe1  <= 1'b0;
                load_all_issued   <= 1'b0;
                load_write_done   <= 1'b0;
                write_index       <= 6'd0;
                state             <= ST_LOAD_STREAM;
                start_flag        <= 1'b1;
            end

            //------------------------------------------------
            // ST_LOAD_STREAM:
            //   Dual-Port parallel read, step size = 2
            //------------------------------------------------
            ST_LOAD_STREAM: begin
                // Pipeline advance
                load_addr_pipe0  <= load_index;
                load_valid_pipe0 <= load_can_issue;
                load_addr_pipe1  <= load_addr_pipe0;
                load_valid_pipe1 <= load_valid_pipe0;

                // Issue next dual read addresses
                if (load_can_issue) begin
                    if (load_index >= (N_DATA - 2)) begin
                        load_all_issued <= 1'b1;
                    end else begin
                        load_index <= load_index + 6'd2; // Step by 2
                    end
                end

                // Detect final write completion
                if (load_write_valid && (load_addr_pipe1 >= (N_DATA - 2))) begin
                    load_write_done <= 1'b1;
                end

                // Transition to ST_RUN when all issued + final write done
                if (load_all_issued && load_write_done) begin
                    load_index       <= 6'd0;
                    load_valid_pipe0 <= 1'b0;
                    load_valid_pipe1 <= 1'b0;
                    state            <= ST_RUN;
                end
            end

            //------------------------------------------------
            // ST_RUN: all 4 cores execute in parallel
            //------------------------------------------------
            ST_RUN: begin
                if (all_cores_done) begin
                    write_index <= 6'd0;
                    state       <= ST_WRITE;
                end
            end

            //------------------------------------------------
            // ST_WRITE: read global_rf[0..63] ? verify_RAM
            //------------------------------------------------
            ST_WRITE: begin
                if (write_index == LAST_INDEX) begin
                    stop_flag <= 1'b1;
                    state     <= ST_DONE;
                end else begin
                    write_index <= write_index + 6'd1;
                end
            end

            ST_DONE: begin
                state <= ST_DONE;
            end

            default: begin
                state <= ST_IDLE;
            end
        endcase
    end
end

//============================================================
// ILA
//============================================================
wire [7:0] pc_word_for_ila;
assign pc_word_for_ila = debug_pc0[9:2];

ila_0 u_ila (
    .clk    (clk),
    .probe0 (test_vector_in),
    .probe1 (verify_vector_out),
    .probe2 (cnt_test),
    .probe3 (state),
    .probe4 (debug_pc0)
);

endmodule // top