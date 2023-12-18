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
add_files ../hdl/counter.v

# Add simulation files
add_files -fileset sim_1 ./tb/testbench.v

# define top module for the current simulation sources.
set_property top testbench [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

close_project
exit
