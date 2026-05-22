## =========================================================
## Lab2 Countdown Timer XDC
## Top module: countdown_timer_top
## FPGA: xc7k160tffg676-2
## Board clock: 50 MHz
## =========================================================

## Required configuration voltage properties
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]


## =========================================================
## Clock: CLK_50M
## =========================================================

set_property PACKAGE_PIN G22 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 20.000 -name sys_clk [get_ports clk]


## =========================================================
## Push Buttons
## KEY1: start / pause
## KEY2: reset
## KEY3: add time
## KEY4: subtract time
##
## Buttons are assumed active-low:
## released = 1
## pressed  = 0
##
## KEY pins are in Bank 34, use LVCMOS18.
## =========================================================

set_property PACKAGE_PIN AF5 [get_ports key_start]
set_property IOSTANDARD LVCMOS18 [get_ports key_start]

set_property PACKAGE_PIN AF4 [get_ports key_reset]
set_property IOSTANDARD LVCMOS18 [get_ports key_reset]

set_property PACKAGE_PIN AF3 [get_ports key_add]
set_property IOSTANDARD LVCMOS18 [get_ports key_add]

set_property PACKAGE_PIN AF2 [get_ports key_sub]
set_property IOSTANDARD LVCMOS18 [get_ports key_sub]


## =========================================================
## Seven Segment Digit Select: TUBE1_COM1 ~ TUBE1_COM4
##
## seg_sel[0] = TUBE1_COM1 -> F10
## seg_sel[1] = TUBE1_COM2 -> E11
## seg_sel[2] = TUBE1_COM3 -> H11
## seg_sel[3] = TUBE1_COM4 -> G11
## =========================================================

set_property PACKAGE_PIN F10 [get_ports {seg_sel[0]}]
set_property PACKAGE_PIN E11 [get_ports {seg_sel[1]}]
set_property PACKAGE_PIN H11 [get_ports {seg_sel[2]}]
set_property PACKAGE_PIN G11 [get_ports {seg_sel[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[*]}]


## =========================================================
## Seven Segment Output: TUBE1_A ~ TUBE1_G + TUBE1_DP
##
## seg_output[0] = A  -> G14
## seg_output[1] = B  -> F13
## seg_output[2] = C  -> G12
## seg_output[3] = D  -> H12
## seg_output[4] = E  -> F9
## seg_output[5] = F  -> D11
## seg_output[6] = G  -> C11
## seg_output[7] = DP -> D8
## =========================================================

set_property PACKAGE_PIN G14 [get_ports {seg_output[0]}]
set_property PACKAGE_PIN F13 [get_ports {seg_output[1]}]
set_property PACKAGE_PIN G12 [get_ports {seg_output[2]}]
set_property PACKAGE_PIN H12 [get_ports {seg_output[3]}]
set_property PACKAGE_PIN F9  [get_ports {seg_output[4]}]
set_property PACKAGE_PIN D11 [get_ports {seg_output[5]}]
set_property PACKAGE_PIN C11 [get_ports {seg_output[6]}]
set_property PACKAGE_PIN D8  [get_ports {seg_output[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_output[*]}]
