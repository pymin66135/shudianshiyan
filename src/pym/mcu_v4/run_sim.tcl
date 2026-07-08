#============================================================
# Script: run_sim.tcl
# Purpose: Create Vivado project and run behavioral simulation
#          for the V3.5 quad-core sorting architecture.
#
# Usage:
#   In Vivado Tcl Console (cd to mcu_v3_5/ first):
#     source run_sim.tcl
#
#   Or from command line:
#     vivado -mode batch -source run_sim.tcl
#
#   With GUI (add -gui flag):
#     vivado -mode batch -source run_sim.tcl -tclargs -gui
#============================================================

#------------------------------------------------------------
# Parse optional -gui flag
#------------------------------------------------------------
set gui_mode 0
foreach arg $argv {
    if {$arg == "-gui"} { set gui_mode 1 }
}

#------------------------------------------------------------
# Project configuration
#------------------------------------------------------------
set project_name   "mcu_v35_quad_core_sim"
set project_dir    "./vivado_sim"
set rtl_dir        "./rtl"
set tb_dir         "./tb"

# Clean up any previous project
if {[file exists $project_dir]} {
    file delete -force $project_dir
}

#------------------------------------------------------------
# Create project
#------------------------------------------------------------
create_project $project_name $project_dir -part xc7a35tcpg236-1
set_property target_language Verilog [current_project]

#------------------------------------------------------------
# Add RTL design sources
#------------------------------------------------------------
set rtl_files [list \
    global_rf_4w4r.v \
    reg_file.v \
    alu.v \
    control_unit.v \
    operand2_decode.v \
    cond_unit.v \
    pc_reg.v \
    cnt_test.v \
    mcu_top.v \
    top.v \
]

foreach f $rtl_files {
    set full_path [file join $rtl_dir $f]
    if {[file exists $full_path]} {
        add_files -norecurse $full_path
        puts "  [OK]  Added RTL: $f"
    } else {
        puts "  [ERR] Missing RTL: $full_path"
    }
}

#------------------------------------------------------------
# Add simulation-only sources (stubs + testbench)
#------------------------------------------------------------
set sim_files [list \
    sim_stubs.v \
    tb_top_v35_quad_core.v \
]

foreach f $sim_files {
    set full_path [file join $tb_dir $f]
    if {[file exists $full_path]} {
        add_files -fileset sim_1 -norecurse $full_path
        puts "  [OK]  Added SIM: $f"
    } else {
        puts "  [ERR] Missing SIM: $full_path"
    }
}

#------------------------------------------------------------
# Set simulation top
#------------------------------------------------------------
set_property top tb_top_v35_simple [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

#------------------------------------------------------------
# Update compile order
#------------------------------------------------------------
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

#------------------------------------------------------------
# Run behavioral simulation
#------------------------------------------------------------
if {$gui_mode} {
    puts "Starting simulation with GUI..."
    launch_simulation
} else {
    puts "Starting simulation in batch mode..."
    launch_simulation -simset sim_1 -mode behavioral

    # Run until $finish is called in the testbench
    # (or set a maximum time if you want to limit)
    run all

    # Close simulation
    close_sim

    puts ""
    puts "============================================"
    puts " Simulation finished. Check the Tcl Console"
    puts " for PASS/FAIL summary above."
    puts "============================================"
}
