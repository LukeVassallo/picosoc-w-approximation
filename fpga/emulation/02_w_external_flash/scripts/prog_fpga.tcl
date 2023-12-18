open_hw_manager
connect_hw_server
open_hw_target
current_hw_device [get_hw_devices xc7a35t_0]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xc7a35t_0] 0]
set_property PROBES.FILE {} [get_hw_devices xc7a35t_0]
set_property FULL_PROBES.FILE {} [get_hw_devices xc7a35t_0]
set_property PROGRAM.FILE {./hw/system.bit} [get_hw_devices xc7a35t_0]
program_hw_devices [get_hw_devices xc7a35t_0]
refresh_hw_device [lindex [get_hw_devices xc7a35t_0] 0]
puts "Please press the red button called 'RESET' at the top right corner of the board."

