# Run from an opened Vivado project created by scripts/create_project.tcl.
set script_path [info script]
if {[file pathtype $script_path] ne "absolute"} {
    set script_path [file join [pwd] $script_path]
}
set script_dir [file dirname $script_path]
set root_dir   [file dirname $script_dir]
set project_name [file tail $root_dir]
set coe_file   [file join $root_dir "coe" "test_rom.coe"]
set data_dir   [file join $root_dir "test_data"]
set input_file [file join $data_dir "sort_input.mem"]
set output_file [file join $data_dir "sort_output.mem"]
if {![file exists $input_file] || ![file exists $output_file]} {
    set data_dir   [file join $root_dir ".." ".." "test_data"]
    set input_file [file join $data_dir "sort_input.mem"]
    set output_file [file join $data_dir "sort_output.mem"]
}
if {![file exists $input_file] || ![file exists $output_file]} {
    error "Missing teacher data files. Checked $root_dir/test_data and [file join $root_dir ".." ".." "test_data"]"
}

if {[llength [get_projects -quiet]] == 0} {
    set project_file [file join $root_dir "vivado_project" "$project_name.xpr"]
    if {![file exists $project_file]} {
        error "No Vivado project is open and project file is missing: $project_file"
    }
    open_project $project_file
}

set test_rom_ip [get_ips -quiet test_ROM]
if {[llength $test_rom_ip] > 0} {
    set_property CONFIG.Coe_File $coe_file $test_rom_ip
}

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
set_property -name xsim.simulate.xsim.more_options \
    -value "-testplusarg INPUT_FILE=$input_file -testplusarg OUTPUT_FILE=$output_file" \
    -objects [get_filesets sim_1]

set xci_files [get_files -quiet *.xci]
foreach xci_file $xci_files {
    if {[catch {generate_target simulation $xci_file} msg]} {
        puts "WARNING: generate_target simulation failed for $xci_file: $msg"
        puts "         Continuing so non-essential simulation IP, such as ILA, does not stop the run early."
    }
}

launch_simulation
run all
puts "Simulation complete. Check console for PASS, total_errors, and cnt_test."
