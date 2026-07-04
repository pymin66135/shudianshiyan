# Run from an opened Vivado project created by scripts/create_project.tcl.
set script_path [info script]
if {[file pathtype $script_path] ne "absolute"} {
    set script_path [file join [pwd] $script_path]
}
set script_dir [file dirname $script_path]
set root_dir   [file dirname $script_dir]
set project_name [file tail $root_dir]
set results_dir [file join $root_dir "results"]
set coe_file   [file join $root_dir "coe" "test_rom.coe"]
set sys_clk_freq_mhz 180.000

if {[llength [get_projects -quiet]] == 0} {
    set project_file [file join $root_dir "vivado_project" "$project_name.xpr"]
    if {![file exists $project_file]} {
        error "No Vivado project is open and project file is missing: $project_file"
    }
    open_project $project_file
}
file mkdir $results_dir

set test_rom_ip [get_ips -quiet test_ROM]
if {[llength $test_rom_ip] > 0} {
    set_property CONFIG.Coe_File $coe_file $test_rom_ip
}

set sys_clk_ip [get_ips -quiet sys_clk]
if {[llength $sys_clk_ip] > 0} {
    set_property CONFIG.PRIM_IN_FREQ 50.000 $sys_clk_ip
    set_property CONFIG.CLKOUT1_REQUESTED_OUT_FREQ $sys_clk_freq_mhz $sys_clk_ip
}

update_compile_order -fileset sources_1
set xci_files [get_files -quiet *.xci]
if {[llength $xci_files] > 0} {
    generate_target all $xci_files
}

reset_run synth_1
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1
wait_on_run impl_1
open_run impl_1
report_timing_summary -file [file join $results_dir "timing_summary.rpt"]
report_utilization -file [file join $results_dir "utilization.rpt"]
puts "Reports written to $results_dir"
