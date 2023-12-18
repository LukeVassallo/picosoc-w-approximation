
module cpu (
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif
	input clk,
	input resetn,
	output mem_valid,
	output mem_instr,
	input  mem_ready,

	output [31:0] mem_addr,
	output [31:0] mem_wdata,
	output [ 3:0] mem_wstrb,
	input  [31:0] mem_rdata,
	//input  [31:0] irq,

	input  [3:0] irq_in,
	output [3:0] irq_out,
	output [3:0] irq_oeb,

	// Pico Co-Processor Interface (PCPI)
	output            pcpi_valid,
	output     [31:0] pcpi_insn,
	output     [31:0] pcpi_rs1,
	output     [31:0] pcpi_rs2,
	// input             pcpi_wr,
	// input      [31:0] pcpi_rd,
	// input             pcpi_wait,
	// input             pcpi_ready,

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
	input            pcpi_div_ready,

	input            pcpi_exact_mul_wr,
	input     [31:0] pcpi_exact_mul_rd,
	input            pcpi_exact_mul_wait,
	input            pcpi_exact_mul_ready,

	input            pcpi_approx_mul_wr,
	input     [31:0] pcpi_approx_mul_rd,
	input            pcpi_approx_mul_wait,
	input            pcpi_approx_mul_ready


);

parameter [0:0] BARREL_SHIFTER = 0;
parameter [0:0] ENABLE_MUL = 0;
parameter [0:0] ENABLE_DIV = 0;
parameter [0:0] ENABLE_FAST_MUL = 0;
parameter [0:0] ENABLE_COMPRESSED = 0;
parameter [0:0] ENABLE_COUNTERS = 0;
parameter [0:0] ENABLE_COUNTERS64 = 0;
parameter [0:0] ENABLE_IRQ_QREGS = 0;

parameter integer MEM_WORDS = 512;
parameter [31:0] STACKADDR = (4*MEM_WORDS);       // end of memory
parameter [31:0] PROGADDR_RESET = 32'h 0000_0000; // 1 MB into flash
parameter [31:0] PROGADDR_IRQ = 32'h 0000_0010;

picorv32 #(
	.STACKADDR(STACKADDR),
	.PROGADDR_RESET(PROGADDR_RESET),
	.PROGADDR_IRQ(PROGADDR_IRQ),
	.BARREL_SHIFTER(BARREL_SHIFTER),
	.COMPRESSED_ISA(ENABLE_COMPRESSED),
	.ENABLE_COUNTERS(ENABLE_COUNTERS),
	.ENABLE_COUNTERS64(ENABLE_COUNTERS64),
	.ENABLE_MUL(ENABLE_MUL),
	.ENABLE_DIV(ENABLE_DIV),
	.ENABLE_PCPI(1),
	.ENABLE_FAST_MUL(ENABLE_FAST_MUL),
	.ENABLE_IRQ(1),
	.ENABLE_IRQ_QREGS(ENABLE_IRQ_QREGS)
) cpu (
	.clk         (clk        ),
	.resetn      (resetn     ),
	.mem_valid   (mem_valid  ),
	.mem_instr   (mem_instr  ),
	.mem_ready   (mem_ready  ),
	.mem_addr    (mem_addr   ),
	.mem_wdata   (mem_wdata  ),
	.mem_wstrb   (mem_wstrb  ),
	.mem_rdata   (mem_rdata  ),
	.irq(irq),

	.pcpi_valid(pcpi_valid),
	.pcpi_insn (pcpi_insn ),
	.pcpi_rs1  (pcpi_rs1  ),
	.pcpi_rs2  (pcpi_rs2  ),
	.pcpi_wr   (pcpi_wr   ),
	.pcpi_rd   (pcpi_rd   ),
	.pcpi_wait (pcpi_wait ),
	.pcpi_ready(pcpi_ready)
);
	wire [31:0] irq;
	assign irq = {25'b0, irq_in, 3'b0};
	assign irq_out = 4'b0;
	assign irq_oeb = 4'b1111;

    //assign pcpi_valid_out = pcpi_valid_in;
    //assign pcpi_insn_out = pcpi_insn_in;
    //assign pcpi_rs1_out = pcpi_rs1_in;
    //assign pcpi_rs2_out = pcpi_rs2_in;

	wire             pcpi_wr;
	wire      [31:0] pcpi_rd;
	wire             pcpi_wait;
	wire             pcpi_ready;

	assign pcpi_wait  = |{pcpi_mul_wait,  pcpi_div_wait, pcpi_exact_mul_wait, pcpi_approx_mul_wait};
	assign pcpi_ready = |{pcpi_mul_ready, pcpi_div_ready, pcpi_exact_mul_ready, pcpi_approx_mul_ready};

	assign pcpi_wr = pcpi_mul_ready ? pcpi_mul_wr : 
	pcpi_div_ready ? pcpi_div_wr :
	pcpi_exact_mul_ready ? pcpi_exact_mul_wr : 
	pcpi_approx_mul_ready ? pcpi_approx_mul_wr : 1'b0;

	assign pcpi_rd = pcpi_mul_ready ? pcpi_mul_rd : 
	pcpi_div_ready ? pcpi_div_rd :
	pcpi_exact_mul_ready ? pcpi_exact_mul_rd :
	pcpi_approx_mul_ready ? pcpi_approx_mul_rd : 32'b0;


	// always @* begin
	// 	//pcpi_int_wr = 0;
	// 	//pcpi_int_rd = 32'bx;
	// 	//pcpi_int_wait  = |{ENABLE_PCPI && pcpi_wait,  (ENABLE_MUL || ENABLE_FAST_MUL) && pcpi_mul_wait,  ENABLE_DIV && pcpi_div_wait};
	// 	//pcpi_int_ready = |{ENABLE_PCPI && pcpi_ready, (ENABLE_MUL || ENABLE_FAST_MUL) && pcpi_mul_ready, ENABLE_DIV && pcpi_div_ready};
	// 	pcpi_wait  = |{pcpi_mul_wait,  pcpi_div_wait};
	// 	pcpi_ready = |{pcpi_mul_ready, pcpi_div_ready};
		
    //     (* parallel_case *)
	// 	case (1'b1)
	// 		//pcpi_ready: begin
	// 		//	pcpi_int_wr = ENABLE_PCPI ? pcpi_wr : 0;
	// 		//	pcpi_int_rd = ENABLE_PCPI ? pcpi_rd : 0;
	// 		//end
	// 		pcpi_mul_ready: begin
	// 			pcpi_wr = pcpi_mul_wr;
	// 			pcpi_rd = pcpi_mul_rd;
	// 		end
	// 		pcpi_div_ready: begin
	// 			pcpi_wr = pcpi_div_wr;
	// 			pcpi_rd = pcpi_div_rd;
	// 		end
	// 	endcase
	// end

endmodule
