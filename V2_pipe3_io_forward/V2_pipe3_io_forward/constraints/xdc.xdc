set_property PACKAGE_PIN G22 [get_ports clk_osc]
set_property IOSTANDARD LVCMOS33 [get_ports clk_osc]
set_property PACKAGE_PIN AC3 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]


create_clock -period 20.000 -name clk_osc_pin -waveform {0.000 10.000} [get_ports clk_osc]
