The purpose of this project is purely for simulation. I investigate the performance of four 8-bit signed multipliers in a SIMD architecture. One of the multpliers is exact, meaning that no computational error is purposely introduced in its output. The remaining three have decreases computational accuracy which they trade of lower area and thus power. The SIMD operation is simple, four multipliers of the same type are instantiates and operated in parallel with two 32-bit input operands and one 32-bit output operand. 

The SIMD module includes a Pico CoProcessor Interface for comunicating with a PicoRV32 CPU.