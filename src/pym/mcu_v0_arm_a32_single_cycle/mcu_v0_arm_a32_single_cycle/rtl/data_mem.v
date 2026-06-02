//============================================================
// Module: data_mem
// Description:
//   Simulation data memory.
//   Word-addressed internally; byte address externally.
//   Combinational read and synchronous write for single-cycle MCU.
//
// Parameters:
//   ADDR_WIDTH : word address width
//
// Inputs:
//   clk        : system clock
//   addr       : byte address
//   write_data : data to be written
//   mem_write  : memory write enable
//
// Outputs:
//   read_data  : data read from memory
//============================================================

`timescale 1ns/1ps

module data_mem #(
    parameter ADDR_WIDTH = 8
)(
    input  wire        clk,
    input  wire [31:0] addr,
    input  wire [31:0] write_data,
    input  wire        mem_write,
    output wire [31:0] read_data
);

localparam DEPTH = (1 << ADDR_WIDTH);

reg [31:0] mem [0:DEPTH-1];
integer i;
wire [ADDR_WIDTH-1:0] word_index;

assign word_index = addr[ADDR_WIDTH+1:2];
assign read_data  = mem[word_index];

initial begin
    for (i = 0; i < DEPTH; i = i + 1) begin
        mem[i] = 32'b0;
    end
end

always @(posedge clk) begin
    if (mem_write) begin
        mem[word_index] <= write_data;
    end
end

endmodule // data_mem
