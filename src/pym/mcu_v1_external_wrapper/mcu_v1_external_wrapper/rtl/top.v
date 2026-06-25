//============================================================
// Module: top
// Description:
//   V1 board top wrapper for sorting application.
//
// Main Structure:
//   1. Input/Output Ports & Parameters: Defines standard clock, reset, and customizable test parameters.
//   2. Clocking: Direct assignment of external oscillator.
//   3. FSM (Finite State Machine): 8-state machine (IDLE->REQ->WAIT1->WAIT2->LOAD->RUN->WRITE->DONE) controlling the data flow.
//   4. test_ROM Instance: Read-only memory for feeding unsorted data.
//   5. verify_RAM Instance: Random-access memory for storing final sorted results. Output masked during ST_RUN.
//   6. Cycle Counter: Measures performance from first ROM read to last RAM write.
//   7. MCU Core Instance: The main processor executing the sorting algorithm.
//   8. ILA (Logic Analyzer): Probes for Vivado hardware debugging.
//============================================================

`timescale 1ns/1ps

module top #(
    parameter PROGRAM_FILE         = "sort64_signed.hex",
    parameter PROGRAM_FROM_FILE    = 0,
    parameter INSTR_ROM_ADDR_WIDTH = 8,
    parameter DATA_MEM_ADDR_WIDTH  = 8,
    parameter DONE_PC              = 32'h000000168,
    parameter N_DATA               = 64
)(
    input wire clk_osc,
    input wire rst
);

//============================================================
// Clock
//============================================================
wire clk;
//assign clk = clk_osc;
sys_clk u_sys_clk (
    .clk_out1(clk),
    .clk_in1 (clk_osc)
);
//============================================================
// State machine
//============================================================
localparam ST_IDLE       = 3'd0;
localparam ST_LOAD_REQ   = 3'd1;
localparam ST_LOAD_WAIT1 = 3'd2;
localparam ST_LOAD_WAIT2 = 3'd3;
localparam ST_LOAD_WRITE = 3'd4;
localparam ST_RUN        = 3'd5;
localparam ST_WRITE      = 3'd6;
localparam ST_DONE       = 3'd7;

reg [2:0] state;
reg [5:0] load_index;
reg [5:0] write_index;
localparam [5:0] LAST_INDEX = N_DATA - 1;

wire rst_n = ~rst;
wire done;

wire mcu_done;

//============================================================
// test_ROM IP
//============================================================
wire        test_rom_en;
wire [5:0]  test_rom_addr;
wire [15:0] test_vector_in;

assign test_rom_en   = (state == ST_LOAD_REQ) ||
                       (state == ST_LOAD_WAIT1) ||
                       (state == ST_LOAD_WAIT2) ||
                       (state == ST_LOAD_WRITE);
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

assign verify_ram_en      = (state == ST_WRITE);
assign verify_ram_we      = (state == ST_WRITE) ? 1'b1 : 1'b0;
assign verify_ram_addr    = write_index;

// [?????] 
// ?? ST_WRITE ??????????????? 16'h0000 ??????
assign verify_vector_out  = (state == ST_WRITE) ? ext_mem_rdata[15:0] : 16'h0000;

verify_RAM u_verify_RAM (
    .clka  (clk),
    .ena   (verify_ram_en),
    .wea   (verify_ram_we),
    .addra (verify_ram_addr),
    .dina  (verify_vector_out),
    .douta (verify_ram_dout)
);

//============================================================
// Counter
//============================================================
reg start_flag;
reg stop_flag;
wire [19:0] cnt_test;

cnt_test u_cnt_test (
    .clk        (clk),
    .rst_n      (rst_n),
    .start_flag (start_flag),
    .stop_flag  (stop_flag),
    .cnt_test   (cnt_test)
);

//============================================================
// MCU core and internal data memory external access
//============================================================
wire        ext_mem_mode;
wire        ext_mem_we;
wire [DATA_MEM_ADDR_WIDTH-1:0] ext_mem_addr;
wire [31:0] ext_mem_wdata;
wire [31:0] ext_mem_rdata;

wire [31:0] debug_pc;
wire [31:0] debug_instr;
wire [31:0] debug_alu_result;
wire [31:0] debug_mem_wdata;
wire [31:0] debug_mem_addr;
wire [31:0] debug_reg_wdata;
wire [3:0]  debug_reg_waddr;
wire        debug_reg_write;
wire        debug_mem_write;
wire [3:0]  debug_flags;
wire        debug_unsupported;

assign ext_mem_mode  = (state != ST_RUN);
assign ext_mem_we    = (state == ST_LOAD_WRITE);
assign ext_mem_addr  = (state == ST_WRITE) ? {{(DATA_MEM_ADDR_WIDTH-6){1'b0}}, write_index} :
                                             {{(DATA_MEM_ADDR_WIDTH-6){1'b0}}, load_index};
assign ext_mem_wdata = {{16{test_vector_in[15]}}, test_vector_in};

wire mcu_rst;
assign mcu_rst = rst || (state == ST_IDLE) ||
                 (state == ST_LOAD_REQ) ||
                 (state == ST_LOAD_WAIT1) ||
                 (state == ST_LOAD_WAIT2) ||
                 (state == ST_LOAD_WRITE);

wire mcu_pc_enable;
assign mcu_pc_enable = (state == ST_RUN);

mcu_top #(
    .PROGRAM_FILE         (PROGRAM_FILE),
    .PROGRAM_FROM_FILE    (PROGRAM_FROM_FILE),
    .INSTR_ROM_ADDR_WIDTH (INSTR_ROM_ADDR_WIDTH),
    .DATA_MEM_ADDR_WIDTH  (DATA_MEM_ADDR_WIDTH)
) u_mcu_top (
    .clk               (clk),
    .rst               (mcu_rst),
    .pc_enable         (mcu_pc_enable),

    .ext_mem_mode      (ext_mem_mode),
    .ext_mem_we        (ext_mem_we),
    .ext_mem_addr      (ext_mem_addr),
    .ext_mem_wdata     (ext_mem_wdata),
    .ext_mem_rdata     (ext_mem_rdata),

    .debug_pc          (debug_pc),
    .debug_instr       (debug_instr),
    .debug_alu_result  (debug_alu_result),
    .debug_mem_wdata   (debug_mem_wdata),
    .debug_mem_addr    (debug_mem_addr),
    .debug_reg_wdata   (debug_reg_wdata),
    .debug_reg_waddr   (debug_reg_waddr),
    .debug_reg_write   (debug_reg_write),
    .debug_mem_write   (debug_mem_write),
    .debug_flags       (debug_flags),
    .debug_unsupported (debug_unsupported)
);

assign mcu_done = (debug_pc[31:2] == DONE_PC[31:2]);
assign done     = (state == ST_DONE);

//============================================================
// FSM sequential logic
//============================================================
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state      <= ST_IDLE;
        load_index <= 6'd0;
        write_index<= 6'd0;
        start_flag <= 1'b0;
        stop_flag  <= 1'b0;
    end else begin
        start_flag <= 1'b0;
        stop_flag  <= 1'b0;

        case (state)
            ST_IDLE: begin
                load_index  <= 6'd0;
                write_index <= 6'd0;
                state       <= ST_LOAD_REQ;
                start_flag  <= 1'b1; 
            end

            ST_LOAD_REQ: begin
                state <= ST_LOAD_WAIT1;
            end

            ST_LOAD_WAIT1: begin
                state <= ST_LOAD_WAIT2;
            end

            ST_LOAD_WAIT2: begin
                state <= ST_LOAD_WRITE;
            end

            ST_LOAD_WRITE: begin
                if (load_index == LAST_INDEX) begin
                    load_index <= 6'd0;
                    state      <= ST_RUN;
                end else begin
                    load_index <= load_index + 6'd1;
                    state      <= ST_LOAD_REQ;
                end
            end

            ST_RUN: begin
                if (mcu_done) begin
                    write_index <= 6'd0;
                    state       <= ST_WRITE;
                end
            end

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
assign pc_word_for_ila = debug_pc[9:2];

ila_0 u_ila (
    .clk    (clk),
    .probe0 (test_vector_in),
    .probe1 (verify_vector_out),
    .probe2 (cnt_test),
    .probe3 (state),
    .probe4 (debug_pc)
);

endmodule // top