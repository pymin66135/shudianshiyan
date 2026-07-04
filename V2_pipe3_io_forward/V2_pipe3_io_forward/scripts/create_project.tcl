# Vivado 2022.2 portable project recreation script.
# Run from this version directory with:
#   vivado -mode batch -source scripts/create_project.tcl
set script_path [info script]
if {[file pathtype $script_path] ne "absolute"} {
    set script_path [file join [pwd] $script_path]
}
set script_dir [file dirname $script_path]
set root_dir   [file dirname $script_dir]
set project_name [file tail $root_dir]
set project_dir [file join $root_dir "vivado_project"]
set part_name "xc7k160tffg676-2"

set coe_file [file join $root_dir "coe" "test_rom.coe"]
set sys_clk_freq_mhz 180.000
if {![file exists $coe_file]} {
    error "Missing local COE file: $coe_file"
}

create_project $project_name $project_dir -part $part_name -force
set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]
set_property ip_output_repo [file join $project_dir "$project_name.cache" "ip"] [current_project]

set rtl_files [glob -nocomplain [file join $root_dir "rtl" "*.v"]]
if {[llength $rtl_files] == 0} {
    error "No RTL files found under [file join $root_dir rtl]"
}
add_files -fileset sources_1 $rtl_files

set xdc_files [glob -nocomplain [file join $root_dir "constraints" "*.xdc"]]
if {[llength $xdc_files] == 0} {
    error "No XDC files found under [file join $root_dir constraints]"
}
add_files -fileset constrs_1 $xdc_files

set ip_files [list \
    [file join $root_dir "ip" "sys_clk" "sys_clk.xci"] \
    [file join $root_dir "ip" "test_ROM" "test_ROM.xci"] \
    [file join $root_dir "ip" "verify_RAM" "verify_RAM.xci"] \
    [file join $root_dir "ip" "ila_0" "ila_0.xci"]]
foreach ip_file $ip_files {
    if {![file exists $ip_file]} {
        error "Missing IP XCI: $ip_file"
    }
    import_ip $ip_file
}

set sys_clk_ip [get_ips -quiet sys_clk]
if {[llength $sys_clk_ip] > 0} {
    set_property CONFIG.PRIM_IN_FREQ 50.000 $sys_clk_ip
    set_property CONFIG.CLKOUT1_REQUESTED_OUT_FREQ $sys_clk_freq_mhz $sys_clk_ip
    puts "sys_clk CLKOUT1_REQUESTED_OUT_FREQ = $sys_clk_freq_mhz MHz"
} else {
    puts "WARNING: get_ips sys_clk returned empty; check IP Sources after project creation."
}

set tb_files [glob -nocomplain [file join $root_dir "tb" "*.v"]]
if {[llength $tb_files] == 0} {
    error "No testbench files found under [file join $root_dir tb]"
}
add_files -fileset sim_1 $tb_files

set_property top top [current_fileset]
set_property top tb_top_v1_full64 [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

set test_rom_ip [get_ips -quiet test_ROM]
if {[llength $test_rom_ip] > 0} {
    set_property CONFIG.Coe_File $coe_file $test_rom_ip
    puts "test_ROM CONFIG.Coe_File = $coe_file"
} else {
    puts "WARNING: get_ips test_ROM returned empty; check IP Sources after project creation."
}

puts "Created portable project $project_name under $project_dir"
puts "Next steps inside Vivado: source scripts/run_sim.tcl or source scripts/run_synth_impl.tcl"
