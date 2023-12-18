The directory contains FPGA related work for the development of PCPI SIMD co-processors. It contains two directories:
- simulation: purely simulation projects in Vivado.
- emulation: FPGA emulation of the design to be hardened.

To start with simulation simply use `make simulation`, optionally preceeded by `make clean` to clear any previous build outputs. Similarly for `emulation`.

simulation/02_error_analysis: After building the project, please run the simulation. The text file containing the numerical data will be available in its entirety when the simulation finishes at simulation/02_error_analysis/work/work/sim/sim_1/behav/xsim/output.txt