//============================================================
// Module: top
// Description:
//   V1 board top wrapper for sorting application.
//
// Main Structure:
//   1. Input/Output Ports & Parameters: Defines standard clock, reset, and customizable test parameters.
//   2. Clocking: Direct assignment of external oscillator.
//   3. FSM (Finite State Machine): stream-load -> RUN -> stream-write flow.
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
    parameter INSTR_ROM_ADDR_WIDTH = 12,
    parameter DATA_MEM_ADDR_WIDTH  = 8,
    parameter DONE_PC              = 32'h000028B4,
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
localparam ST_LOAD_STREAM= 3'd1;
localparam ST_RUN        = 3'd5;
localparam ST_WRITE      = 3'd6;
localparam ST_DONE       = 3'd7;

reg [2:0] state;
reg [5:0] load_req_index;
reg [5:0] load_addr_pipe0;
reg [5:0] load_addr_pipe1;
reg [5:0] load_addr_pipe2;
reg       load_valid_pipe0;
reg       load_valid_pipe1;
reg       load_valid_pipe2;
reg       load_issue_done;
reg       load_write_done;
reg [5:0] write_index;
localparam [5:0] LAST_INDEX = N_DATA - 1;

wire rst_n = ~rst;
wire done;

wire mcu_done;

wire        load_stream_active;
wire        load_can_issue;
wire        load_write_valid;
wire        load_write_last;
wire        write_stream_active;
wire        write_last;

//============================================================
// MCU core and internal data memory external access
//============================================================
wire        ext_mem_mode;
wire        ext_mem_we;
wire [DATA_MEM_ADDR_WIDTH-1:0] ext_mem_addr;
wire [31:0] ext_mem_wdata;
wire [31:0] ext_mem_rdata;

assign load_stream_active = (state == ST_LOAD_STREAM);
assign load_can_issue     = load_stream_active && !load_issue_done;
assign load_write_valid   = load_stream_active && load_valid_pipe2;
assign load_write_last    = load_write_valid && (load_addr_pipe2 == LAST_INDEX);
assign write_stream_active= (state == ST_WRITE);
assign write_last         = (write_index == LAST_INDEX);

//============================================================
// test_ROM IP
//============================================================
wire        test_rom_en;
wire [5:0]  test_rom_addr;
wire [15:0] test_vector_in;

assign test_rom_en   = load_stream_active && !load_write_done;
assign test_rom_addr = load_req_index;

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

assign verify_ram_en      = write_stream_active;
assign verify_ram_we      = write_stream_active ? 1'b1 : 1'b0;
assign verify_ram_addr    = write_index;
assign verify_vector_out  = write_stream_active ? ext_mem_rdata[15:0] : 16'h0000;

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
assign ext_mem_we    = load_write_valid;
assign ext_mem_addr  = (state == ST_WRITE) ? {{(DATA_MEM_ADDR_WIDTH-6){1'b0}}, write_index} :
                                             {{(DATA_MEM_ADDR_WIDTH-6){1'b0}}, load_addr_pipe2};
assign ext_mem_wdata = {{16{test_vector_in[15]}}, test_vector_in};

wire mcu_rst;
assign mcu_rst = rst || (state == ST_IDLE) ||
                 (state == ST_LOAD_STREAM);

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
        state            <= ST_IDLE;
        load_req_index   <= 6'd0;
        load_addr_pipe0  <= 6'd0;
        load_addr_pipe1  <= 6'd0;
        load_addr_pipe2  <= 6'd0;
        load_valid_pipe0 <= 1'b0;
        load_valid_pipe1 <= 1'b0;
        load_valid_pipe2 <= 1'b0;
        load_issue_done  <= 1'b0;
        load_write_done  <= 1'b0;
        write_index      <= 6'd0;
        start_flag       <= 1'b0;
        stop_flag        <= 1'b0;
    end else begin
        start_flag <= 1'b0;
        stop_flag  <= 1'b0;

        case (state)
            ST_IDLE: begin
                load_req_index   <= 6'd0;
                load_addr_pipe0  <= 6'd0;
                load_addr_pipe1  <= 6'd0;
                load_addr_pipe2  <= 6'd0;
                load_valid_pipe0 <= 1'b0;
                load_valid_pipe1 <= 1'b0;
                load_valid_pipe2 <= 1'b0;
                load_issue_done  <= 1'b0;
                load_write_done  <= 1'b0;
                write_index      <= 6'd0;
                state            <= ST_LOAD_STREAM;
                start_flag       <= 1'b1; 
            end

            ST_LOAD_STREAM: begin
                load_addr_pipe0  <= load_req_index;
                load_valid_pipe0 <= load_can_issue;
                load_addr_pipe1  <= load_addr_pipe0;
                load_valid_pipe1 <= load_valid_pipe0;
                load_addr_pipe2  <= load_addr_pipe1;
                load_valid_pipe2 <= load_valid_pipe1;

                if (load_can_issue) begin
                    if (load_req_index == LAST_INDEX) begin
                        load_issue_done <= 1'b1;
                    end else begin
                        load_req_index <= load_req_index + 6'd1;
                    end
                end

                if (load_write_last) begin
                    load_write_done  <= 1'b1;
                    load_req_index   <= 6'd0;
                    load_valid_pipe0 <= 1'b0;
                    load_valid_pipe1 <= 1'b0;
                    load_valid_pipe2 <= 1'b0;
                    state            <= ST_RUN;
                end
            end

            ST_RUN: begin
                if (mcu_done) begin
                    write_index <= 6'd0;
                    state       <= ST_WRITE;
                end
            end

            ST_WRITE: begin
                if (write_last) begin
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
