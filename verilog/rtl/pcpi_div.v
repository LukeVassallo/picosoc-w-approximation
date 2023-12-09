module pcpi_div (
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif    
    input             clk,
    input             resetn,
    input             pcpi_div_valid,
    input      [31:0] pcpi_insn,
	input      [31:0] pcpi_rs1,
	input      [31:0] pcpi_rs2,
	output            pcpi_div_wr,
	output     [31:0] pcpi_div_rd,
	output            pcpi_div_wait,
	output            pcpi_div_ready
);

	picorv32_pcpi_div 
        picorv32_pcpi_div_inst_0 (
        .clk       (clk            ),
        .resetn    (resetn         ),
        .pcpi_valid(pcpi_div_valid ),
        .pcpi_insn (pcpi_insn      ),
        .pcpi_rs1  (pcpi_rs1       ),
        .pcpi_rs2  (pcpi_rs2       ),
        .pcpi_wr   (pcpi_div_wr    ),
        .pcpi_rd   (pcpi_div_rd    ),
        .pcpi_wait (pcpi_div_wait  ),
        .pcpi_ready(pcpi_div_ready )
    );
endmodule