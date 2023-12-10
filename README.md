# Caravel User Project

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

| :exclamation: Important Note            |
|-----------------------------------------|

[toc]

Overview
========
This projects extends picosoc with two 8-bit SIMD multpliers each capable 
of performing four multiplications per instruction. The multpliers are 
interfaced with the processor via the PCPI port and are accessed with 
a custom instruction. The architecture of the mulpliers is different, 
one is exact while the other is approximate. Approximate multipliers 
trade computational accuary for area, latency and power.

Below is a block diagram of the SoC and the architecture of the SIMD 
multpliers. 


<figure style="display:inline-block;" >
<img src="./.figs/soc-block-diagram.png" alt="System on Chip (SoC) block diagram illustrating vanilla picorv32 together with SIMD exact and approximate multiplier extensions." style="vertical-align:top;">
<figcaption style="text-align:center;"><br>Fig.1 - System on Chip (SoC) block diagram illustrating vanilla picorv32 together with SIMD exact and approximate multiplier extensions.</figcaption>
</figure>

<figure style="display:inline-block;" >
<img src="./.figs/multiplier-extension-architecture.png" alt="High-level block representation of a SIMD multiplier extension. Two 32-bit registers provide input data is concurrent processed by four multpliers in 8-bit increments." style="vertical-align:top;">
<figcaption style="text-align:center;"><br>Fig.2 - High-level block representation of a SIMD multiplier extension. Two 32-bit registers provide input data is concurrent processed by four multpliers in 8-bit increments.</figcaption>
</figure>

<figure style="display:inline-block;" >
<img src="./.figs/module-rd-formatting.png" alt="Illustration of how the individual results of the multpliers are packed into a single 32-bit output register. The number of bits to encode the results of a multiplication is twice that of its operands, therefore we can store two 16-bit results or selectively pack the upper or lower 8-bits from four multiplications. How this is performed is described by a custom instruction." style="vertical-align:top;">
<figcaption style="text-align:center;"><br>Fig.3 - Illustration of how the individual results of the multpliers are packed into a single 32-bit output register. The number of bits to encode the results of a multiplication is twice that of its operands, therefore we can store two 16-bit results or selectively pack the upper or lower 8-bits from four multiplications. How this is performed is described by a custom instruction.</figcaption>
</figure>

<figure style="display:inline-block;" >
<img src="./.figs/custom-instruction.png" alt="Description of a custom R-type RISC V instruction for using the SIMD multiplier extensions. Moving right to left, the first 7-bits consits of the opcode, the next 5-bits selets one of the 32-bit cpu registers for storing the result, the 3-bits of funct3 specify whether a dual/quad operation is performed and how the result is stored, rs1 and rs2 specify two source registers, and funct7 dictates weather the exact or approximate extension is used for calculation." style="vertical-align:top;">
<figcaption style="text-align:center;"><br>Fig.4 - Description of a custom R-type RISC V instruction for using the SIMD multiplier extensions. Moving right to left, the first 7-bits consits of the opcode, the next 5-bits selets one of the 32-bit cpu registers for storing the result, the 3-bits of funct3 specify whether a dual/quad operation is performed and how the result is stored, rs1 and rs2 specify two source registers, and funct7 dictates weather the exact or approximate extension is used for calculation.</figcaption>
</figure>


This project has some research applicability in approximate computing. The
main goal was to learn combine scalar processors with custom acceleators 
and have great felxibility in the design process. For me this means that 
I can quickly simulate, FPGA test and tape-out and ASIC. Figure depcits 
what this repository offers, in a nutshell:
- Compile assembly or C application code targeting the SoC.
- Simulate the SoC with custom application and view waveforms.
- Implement the SoC on a Xilinx SoC using proprietary or open-source toolchain.
- Implement the SoC on a Lattice SoC using open-source toolchain.
- Harden the individual macros (block) using OpenLane. 
- Integrate the macros and generate GDSII layout files. 
