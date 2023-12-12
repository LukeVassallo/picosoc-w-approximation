
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2023.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# pcpi_approx_mul, pcpi_exact_mul, pcpi_approx_mul_c, pcpi_approx_mul_d

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

# set list_projs [get_projects -quiet]
# if { $list_projs eq "" } {
#    create_project project_1 myproj -part xc7a35tcsg324-1
# }


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir ./bd

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2030 -severity "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_gid_msg -ssname BD::TCL -id 2031 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_gid_msg -ssname BD::TCL -id 2032 -severity "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2033 -severity "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2034 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2035 -severity "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_gid_msg -ssname BD::TCL -id 2036 -severity "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2037 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_gid_msg -ssname BD::TCL -id 2038 -severity "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:c_counter_binary:12.0\
xilinx.com:ip:xlconcat:2.1\
xilinx.com:ip:xlslice:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
pcpi_approx_mul\
pcpi_exact_mul\
pcpi_approx_mul_c\
pcpi_approx_mul_d\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set aresetn [ create_bd_port -dir I -type rst aresetn ]
  set clk [ create_bd_port -dir I -type clk -freq_hz 100000000 clk ]
  set pcpi_valid [ create_bd_port -dir I pcpi_valid ]
  set pcpi_insn_a [ create_bd_port -dir I -from 31 -to 0 pcpi_insn_a ]
  set pcpi_insn_b [ create_bd_port -dir I -from 31 -to 0 pcpi_insn_b ]
  set pcpi_insn_c [ create_bd_port -dir I -from 31 -to 0 pcpi_insn_c ]
  set pcpi_insn_d [ create_bd_port -dir I -from 31 -to 0 pcpi_insn_d ]

  # Create instance: pcpi_approx_mul_0, and set properties
  set block_name pcpi_approx_mul
  set block_cell_name pcpi_approx_mul_0
  if { [catch {set pcpi_approx_mul_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pcpi_approx_mul_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pcpi_exact_mul_0, and set properties
  set block_name pcpi_exact_mul
  set block_cell_name pcpi_exact_mul_0
  if { [catch {set pcpi_exact_mul_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pcpi_exact_mul_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [list \
    CONFIG.RESET_PORT {resetn} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
  ] $clk_wiz_0


  # Create instance: c_counter_binary_0, and set properties
  set c_counter_binary_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 c_counter_binary_0 ]
  set_property CONFIG.CE {true} $c_counter_binary_0


  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [list \
    CONFIG.IN0_WIDTH {8} \
    CONFIG.IN1_WIDTH {8} \
    CONFIG.IN2_WIDTH {8} \
    CONFIG.IN3_WIDTH {8} \
    CONFIG.NUM_PORTS {4} \
  ] $xlconcat_0


  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {7} \
    CONFIG.DIN_WIDTH {16} \
  ] $xlslice_0


  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {15} \
    CONFIG.DIN_TO {8} \
    CONFIG.DIN_WIDTH {16} \
  ] $xlslice_1


  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [list \
    CONFIG.IN0_WIDTH {8} \
    CONFIG.IN1_WIDTH {8} \
    CONFIG.IN2_WIDTH {8} \
    CONFIG.IN3_WIDTH {8} \
    CONFIG.NUM_PORTS {4} \
  ] $xlconcat_1


  # Create instance: pcpi_approx_mul_c_0, and set properties
  set block_name pcpi_approx_mul_c
  set block_cell_name pcpi_approx_mul_c_0
  if { [catch {set pcpi_approx_mul_c_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pcpi_approx_mul_c_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pcpi_approx_mul_d_0, and set properties
  set block_name pcpi_approx_mul_d
  set block_cell_name pcpi_approx_mul_d_0
  if { [catch {set pcpi_approx_mul_d_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pcpi_approx_mul_d_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net Net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins pcpi_approx_mul_0/clk] [get_bd_pins pcpi_exact_mul_0/clk] [get_bd_pins c_counter_binary_0/CLK] [get_bd_pins pcpi_approx_mul_c_0/clk] [get_bd_pins pcpi_approx_mul_d_0/clk]
  connect_bd_net -net Net1 [get_bd_pins clk_wiz_0/locked] [get_bd_pins pcpi_exact_mul_0/resetn] [get_bd_pins pcpi_approx_mul_0/resetn] [get_bd_pins pcpi_approx_mul_c_0/resetn] [get_bd_pins pcpi_approx_mul_d_0/resetn]
  connect_bd_net -net Net2 [get_bd_ports pcpi_valid] [get_bd_pins pcpi_exact_mul_0/pcpi_valid] [get_bd_pins pcpi_approx_mul_0/pcpi_valid] [get_bd_pins c_counter_binary_0/CE] [get_bd_pins pcpi_approx_mul_c_0/pcpi_valid] [get_bd_pins pcpi_approx_mul_d_0/pcpi_valid]
  connect_bd_net -net Net4 [get_bd_pins xlconcat_0/dout] [get_bd_pins pcpi_approx_mul_0/pcpi_rs1] [get_bd_pins pcpi_exact_mul_0/pcpi_rs1] [get_bd_pins pcpi_approx_mul_c_0/pcpi_rs1] [get_bd_pins pcpi_approx_mul_d_0/pcpi_rs1]
  connect_bd_net -net Net5 [get_bd_pins xlconcat_1/dout] [get_bd_pins pcpi_approx_mul_0/pcpi_rs2] [get_bd_pins pcpi_exact_mul_0/pcpi_rs2] [get_bd_pins pcpi_approx_mul_c_0/pcpi_rs2] [get_bd_pins pcpi_approx_mul_d_0/pcpi_rs2]
  connect_bd_net -net Net6 [get_bd_pins c_counter_binary_0/Q] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din]
  connect_bd_net -net Net7 [get_bd_pins xlslice_0/Dout] [get_bd_pins xlconcat_0/In3] [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconcat_0/In0] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net aresetn_1 [get_bd_ports aresetn] [get_bd_pins clk_wiz_0/resetn]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net pcpi_insn_a_1 [get_bd_ports pcpi_insn_a] [get_bd_pins pcpi_exact_mul_0/pcpi_insn]
  connect_bd_net -net pcpi_insn_b_1 [get_bd_ports pcpi_insn_b] [get_bd_pins pcpi_approx_mul_0/pcpi_insn]
  connect_bd_net -net pcpi_insn_c_1 [get_bd_ports pcpi_insn_c] [get_bd_pins pcpi_approx_mul_c_0/pcpi_insn]
  connect_bd_net -net pcpi_insn_d_1 [get_bd_ports pcpi_insn_d] [get_bd_pins pcpi_approx_mul_d_0/pcpi_insn]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins xlslice_1/Dout] [get_bd_pins xlconcat_1/In3] [get_bd_pins xlconcat_1/In0] [get_bd_pins xlconcat_1/In2] [get_bd_pins xlconcat_1/In1]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


