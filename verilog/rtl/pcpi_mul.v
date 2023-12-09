module pcpi_mul (
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif    
    input             clk,
    input             resetn,
    input             pcpi_mul_valid,
    input      [31:0] pcpi_insn,
	input      [31:0] pcpi_rs1,
	input      [31:0] pcpi_rs2,
	output            pcpi_mul_wr,
	output     [31:0] pcpi_mul_rd,
	output            pcpi_mul_wait,
	output            pcpi_mul_ready
);

	picorv32_pcpi_mul #(
        .STEPS_AT_ONCE(1),
        .CARRY_CHAIN(4)
        )
        picorv32_pcpi_mul_inst_0 (
        .clk       (clk            ),
        .resetn    (resetn         ),
        .pcpi_valid(pcpi_mul_valid ),
        .pcpi_insn (pcpi_insn      ),
        .pcpi_rs1  (pcpi_rs1       ),
        .pcpi_rs2  (pcpi_rs2       ),
        .pcpi_wr   (pcpi_mul_wr    ),
        .pcpi_rd   (pcpi_mul_rd    ),
        .pcpi_wait (pcpi_mul_wait  ),
        .pcpi_ready(pcpi_mul_ready )
    );

endmodule