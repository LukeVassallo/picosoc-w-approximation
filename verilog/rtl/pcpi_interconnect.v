module pcpi_interconnect (
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif	
    // input clk,
    // input resetn,

    // picorv32
    //input            pcpi_valid_in,
	//input     [31:0] pcpi_insn_in,
	//input     [31:0] pcpi_rs1_in,
	//input     [31:0] pcpi_rs2_in,
	output    reg       pcpi_wr,
	output    reg [31:0] pcpi_rd,
	output    reg       pcpi_wait,
	output    reg       pcpi_ready,

    // common signals
    //output             pcpi_valid_out,
    //output      [31:0] pcpi_insn_out,
	//output      [31:0] pcpi_rs1_out,
	//output      [31:0] pcpi_rs2_out,

    // picorv32 mul
    //output             pcpi_mul_valid,
	input            pcpi_mul_wr,
	input     [31:0] pcpi_mul_rd,
	input            pcpi_mul_wait,
	input            pcpi_mul_ready,

    // picorv32 div
    //output             pcpi_div_valid,
	input            pcpi_div_wr,
	input     [31:0] pcpi_div_rd,
	input            pcpi_div_wait,
	input            pcpi_div_ready    
);
    localparam ENABLE_MUL = 1;
    localparam ENABLE_DIV = 1;

    //assign pcpi_valid_out = pcpi_valid_in;
    //assign pcpi_insn_out = pcpi_insn_in;
    //assign pcpi_rs1_out = pcpi_rs1_in;
    //assign pcpi_rs2_out = pcpi_rs2_in;

	always @* begin
		//pcpi_int_wr = 0;
		//pcpi_int_rd = 32'bx;
		//pcpi_int_wait  = |{ENABLE_PCPI && pcpi_wait,  (ENABLE_MUL || ENABLE_FAST_MUL) && pcpi_mul_wait,  ENABLE_DIV && pcpi_div_wait};
		//pcpi_int_ready = |{ENABLE_PCPI && pcpi_ready, (ENABLE_MUL || ENABLE_FAST_MUL) && pcpi_mul_ready, ENABLE_DIV && pcpi_div_ready};
		pcpi_wait  = |{ENABLE_MUL && pcpi_mul_wait,  ENABLE_DIV && pcpi_div_wait};
		pcpi_ready = |{ENABLE_MUL && pcpi_mul_ready, ENABLE_DIV && pcpi_div_ready};
		
        (* parallel_case *)
		case (1'b1)
			//pcpi_ready: begin
			//	pcpi_int_wr = ENABLE_PCPI ? pcpi_wr : 0;
			//	pcpi_int_rd = ENABLE_PCPI ? pcpi_rd : 0;
			//end
			ENABLE_MUL && pcpi_mul_ready: begin
				pcpi_wr = pcpi_mul_wr;
				pcpi_rd = pcpi_mul_rd;
			end
			ENABLE_DIV && pcpi_div_ready: begin
				pcpi_wr = pcpi_div_wr;
				pcpi_rd = pcpi_div_rd;
			end
		endcase
	end
endmodule
