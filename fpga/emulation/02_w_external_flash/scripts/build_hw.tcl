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
add_files hdl/arty_35t.v
add_files hdl/user_project_wrapper.v
add_files ../../../verilog/rtl/cpu.v
add_files ../../../verilog/rtl/picorv32.v
add_files ../../../verilog/rtl/simpleuart.v
add_files ../../../verilog/rtl/spimemio.v
add_files ../../../verilog/rtl/simple_interconnect.v
add_files ../../../verilog/rtl/ctrl.v
add_files ../../../verilog/rtl/pcpi_mul.v
add_files ../../../verilog/rtl/pcpi_div.v
add_files ../../../verilog/rtl/pcpi_exact_mul.v
add_files ../../../verilog/rtl/pcpi_approx_mul.v
add_files ../../../verilog/rtl/SCDM8_51.v
add_files ../../../verilog/rtl/S_Exact8.v
add_files ../../../verilog/rtl/scdm_common.v
add_files ../../../verilog/rtl/user_proj_example.v

# Add simulation files
add_files -fileset sim_1 tb/w25q128.v
add_files -fileset sim_1 ../fw/app_02/bin/firmware.hex
add_files -fileset sim_1 tb/tb.v

# Add constraints files
add_files -fileset constrs_1 xdc/board.xdc

# define top module for the design.
set_property top arty_35t [current_fileset]
update_compile_order -fileset sources_1

# define top module for the simulation fileset.
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

# Add IP
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name blk_mem_gen_0
set_property -dict [list \
  CONFIG.Byte_Size {8} \
  CONFIG.Enable_A {Use_ENA_Pin} \
  CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
  CONFIG.Use_Byte_Write_Enable {true} \
  CONFIG.Write_Depth_A {512} \
  CONFIG.Write_Width_A {32} \
] [get_ips blk_mem_gen_0]

generate_target {instantiation_template} [get_files /work/work.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci]
generate_target all [get_files /work/work.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci]
export_ip_user_files -of_objects [get_files work/work.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci] -no_script -sync -force -quiet
export_simulation -of_objects [get_files work/work.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci] -directory work/work.ip_user_files/sim_scripts -ip_user_files_dir work/work.ip_user_files -ipstatic_source_dir /work/work.ip_user_files/ipstatic -lib_map_path [list {modelsim=work/work.cache/compile_simlib/modelsim} {questa=work/work.cache/compile_simlib/questa} {xcelium=work/work.cache/compile_simlib/xcelium} {vcs=work/work.cache/compile_simlib/vcs} {riviera=work/work.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] work/work.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci]

create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name clk_wiz_0  
set_property -dict [list \
CONFIG.CLKOUT1_JITTER {286.142} \
CONFIG.CLKOUT1_PHASE_ERROR {137.956} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {12.5} \
CONFIG.MMCM_CLKFBOUT_MULT_F {15.125} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {60.500} \
CONFIG.MMCM_DIVCLK_DIVIDE {2} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
] [get_ips clk_wiz_0]  
generate_target {instantiation_template} [get_files work/work.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]
generate_target all [get_files work/work.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]  
export_ip_user_files -of_objects [get_files work/work.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci] -no_script -sync -force -quiet  
export_simulation -of_objects [get_files work/work.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci] -directory work/work.ip_user_files/sim_scripts -ip_user_files_dir work/work.ip_user_files -ipstatic_source_dir work/work.ip_user_files/ipstatic -lib_map_path [list {modelsim=/work/work.cache/compile_simlib/modelsim} {questa=/work/work.cache/compile_simlib/questa} {xcelium=work/work.cache/compile_simlib/xcelium} {vcs=work/work.cache/compile_simlib/vcs} {riviera=work/work.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] work/work.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]
launch_runs blk_mem_gen_0_synth_1 clk_wiz_0_synth_1 -jobs 2

# set the vivado implementation strategy to 'Performance_NetDelay_high'
#set_property strategy Performance_NetDelay_high [get_runs impl_1]

launch_runs -jobs $jobs synth_1	; # launched in the background
wait_on_run synth_1	; # therefore we must wait before proceeding

launch_runs impl_1 -jobs $jobs -to_step write_bitstream
wait_on_run impl_1

puts "Running write bitstream"

# fixed - enables the platform to be used in software development flow but not acceleration
# force - overwrite if xsa already exists
# include_bit - by default MCS files are created and bistreams are discarded.
write_hw_platform -fixed -force -include_bit hw/system.xsa

open_run impl_1 
write_bitstream -verbose -force hw/system.bit
close_design

close_project
