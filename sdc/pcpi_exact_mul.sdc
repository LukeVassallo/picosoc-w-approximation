###############################################################################
# Created by write_sdc
# Sun Dec 10 10:59:30 2023
###############################################################################
current_design pcpi_exact_mul
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 100.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_clock_latency -source -min 4.6500 [get_clocks {clk}]
set_clock_latency -source -max 5.5700 [get_clocks {clk}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.1900 [get_ports {pcpi_ready}]
set_load -pin_load 0.1900 [get_ports {pcpi_wait}]
set_load -pin_load 0.1900 [get_ports {pcpi_wr}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[31]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[30]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[29]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[28]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[27]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[26]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[25]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[24]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[23]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[22]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[21]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[20]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[19]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[18]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[17]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[16]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[15]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[14]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[13]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[12]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[11]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[10]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[9]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[8]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[7]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[6]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[5]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[4]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[3]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[2]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[1]}]
set_load -pin_load 0.1900 [get_ports {pcpi_rd[0]}]
set_input_transition 0.6100 [get_ports {clk}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 3.0000 [current_design]
set_max_fanout 4.0000 [current_design]
