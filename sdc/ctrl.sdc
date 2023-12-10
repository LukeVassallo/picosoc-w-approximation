###############################################################################
# Created by write_sdc
# Sun Dec 10 18:20:09 2023
###############################################################################
current_design ctrl
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 100.0000 [get_ports {ctrl_in[0]}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_clock_latency -source -min 4.6500 [get_clocks {clk}]
set_clock_latency -source -max 5.5700 [get_clocks {clk}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.1900 [get_ports {reset}]
set_load -pin_load 0.1900 [get_ports {resetn}]
set_load -pin_load 0.1900 [get_ports {ctrl_oeb[1]}]
set_load -pin_load 0.1900 [get_ports {ctrl_oeb[0]}]
set_load -pin_load 0.1900 [get_ports {ctrl_out[1]}]
set_load -pin_load 0.1900 [get_ports {ctrl_out[0]}]
set_input_transition 0.6100 [get_ports {ctrl_in[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 3.0000 [current_design]
set_max_fanout 4.0000 [current_design]
