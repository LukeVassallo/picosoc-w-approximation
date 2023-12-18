set outputdir work
set projectName work
set partNumber xc7a35tcsg324-1
set jobs 4

# TODO: Input validation
if { $argc != 0 } {
    puts "Changing the number of jobs from $jobs to [lindex $argv 0]"
    set jobs [lindex $argv 0]
    puts "Variable jobs now contains the value $jobs"
}

file mkdir $outputdir

create_project -part $partNumber $projectName $outputdir

# Add source files 
add_files ../hdl/scdm_common.v
add_files ../hdl/S_Exact8.v
add_files ../hdl/SCDM8_51.v
add_files ../hdl/SCDM8_73.v
add_files ../hdl/SCDM8_95.v
add_files ../hdl/pcpi_exact_mul.v
add_files ../hdl/pcpi_approx_mul.v
add_files ../hdl/pcpi_approx_mul_c.v
add_files ../hdl/pcpi_approx_mul_d.v

# Add simulation files
add_files -fileset sim_1 ./tb/design_1_wrapper_tb.v

# Create an empty block diagram
# create_bd_design -name design_1 -dir ./bd   

# Import .tcl procs ( these are user designs previously exported. )
source scripts/build_bd.tcl    

# Built it 
# create_root_design "" # Called as the last thing in build_bd.tcl

# generate a wrapper (top - file) for the block design.
make_wrapper -top [get_files bd/design_1/design_1.bd]

# add the hdl wrapper to the project
add_files -fileset sources_1 bd/design_1/hdl/design_1_wrapper.v

# define top module for the current design sources.
set_property top design_1_wrapper [current_fileset]
update_compile_order -fileset sources_1

# define top module for the current simulation sources.
set_property top design_1_wrapper_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

close_project 


