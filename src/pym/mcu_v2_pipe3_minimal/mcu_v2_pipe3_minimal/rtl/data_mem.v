//============================================================
// Module: data_mem
// Description:
//   Internal data memory for V1 external wrapper flow.
//
//   Normal MCU mode:
//     - byte address from ALU result
//     - combinational read
//     - synchronous write
//
//   External mode:
//     - top.v can write data loaded from test_ROM into internal RAM
//     - top.v can read sorted data back and write verify_RAM
//
//   One 16-bit signed input is stored in one 32-bit word.
//   top.v sign-extends test_vector_in before writing here.
//============================================================

`timescale 1ns/1ps

module data_mem #(
    parameter ADDR_WIDTH = 8
)(
    input  wire        clk,

    // MCU access port
    input  wire [31:0] addr,
    input  wire [31:0] write_data,
    input  wire        mem_write,
    output wire [31:0] read_data,

    // External top.v access port
    input  wire        ext_mode,
    input  wire        ext_we,
    input  wire [ADDR_WIDTH-1:0] ext_addr,
    input  wire [31:0] ext_wdata,
    output wire [31:0] ext_rdata
);

localparam DEPTH = (1 << ADDR_WIDTH);

reg [31:0] mem [0:DEPTH-1];
integer i;
wire [ADDR_WIDTH-1:0] word_index;

assign word_index = addr[ADDR_WIDTH+1:2];
assign read_data  = mem[word_index];
assign ext_rdata  = mem[ext_addr];

initial begin
    for (i = 0; i < DEPTH; i = i + 1) begin
        mem[i] = 32'b0;
    end
end

always @(posedge clk) begin
    if (ext_mode) begin
        if (ext_we) begin
            mem[ext_addr] <= ext_wdata;
        end
    end else begin
        if (mem_write) begin
            mem[word_index] <= write_data;
        end
    end
end

endmodule // data_mem
