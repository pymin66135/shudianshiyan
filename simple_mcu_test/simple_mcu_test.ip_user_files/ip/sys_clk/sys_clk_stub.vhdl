-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Fri Jun  5 10:05:20 2026
-- Host        : pymin66135 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               f:/FPGA/shudianshiyan/simple_mcu_test/simple_mcu_test.gen/sources_1/ip/sys_clk/sys_clk_stub.vhdl
-- Design      : sys_clk
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tffg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sys_clk is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end sys_clk;

architecture stub of sys_clk is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_in1";
begin
end;
