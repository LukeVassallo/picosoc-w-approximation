module simple_interconnect (
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif
	input clk,
	input resetn,
    //output [7:0] leds,

	input  [15:0] gpio_in,
	output [15:0] gpio_out,
	output [15:0] gpio_oeb,

	//output [31:0] irq,

	input mem_valid,
	input mem_instr,
	output  mem_ready,

	input [31:0] mem_addr,
	input [31:0] mem_wdata,
	input [ 3:0] mem_wstrb,
	output  [31:0] mem_rdata,

    input spimem_ready,
    output spimem_valid,
	input [31:0] spimem_rdata,

    output [3:0] spimemio_cfgreg_we,
    input [31:0] spimemio_cfgreg_do,

    output [3:0] simpleuart_div_we,
    input [31:0] simpleuart_reg_div_do,

    output simpleuart_dat_we,
    output simpleuart_dat_re,
    input [31:0] simpleuart_reg_dat_do,
    input simpleuart_reg_dat_wait,

    input [31:0] ram_rdata,
    output [3:0] ram_gwenb,
	output [31:0] ram_wenb

    );

    parameter integer MEM_WORDS = 512;

	wire        iomem_valid;
	reg         iomem_ready;
	wire [3:0]  iomem_wstrb;
	wire [31:0] iomem_addr;
	wire [31:0] iomem_wdata;
	reg  [31:0] iomem_rdata;

	reg [31:0] gpio;

	assign gpio_out = gpio[15:0];
	assign gpio_oeb = 16'b0;

	always @(posedge clk) begin
		if (!resetn) begin
			gpio <= 0;
		end else begin
			iomem_ready <= 0;
			if (iomem_valid && !iomem_ready && iomem_addr[31:24] == 8'h 03) begin
				iomem_ready <= 1;
				iomem_rdata <= gpio;
				if (iomem_wstrb[0]) gpio[ 7: 0] <= iomem_wdata[ 7: 0];
				if (iomem_wstrb[1]) gpio[15: 8] <= iomem_wdata[15: 8];
				if (iomem_wstrb[2]) gpio[23:16] <= iomem_wdata[23:16];
				if (iomem_wstrb[3]) gpio[31:24] <= iomem_wdata[31:24];
			end
		end
	end    

//	assign irq = {25'b0, irq_in, 3'b0};
//	wire irq_stall = 0;
//	wire irq_uart = 0;

//	always @* begin
//		irq = 0;
//		irq[3] = irq_stall;
//		irq[4] = irq_uart;
//		irq[5] = 1'b0;
//		irq[6] = 1'b0;
//		irq[7] = 1'b0;
//	end

	reg ram_ready;
	//wire [31:0] ram_rdata;

	always @(posedge clk)
		ram_ready <= mem_valid && !mem_ready && mem_addr < 4*MEM_WORDS;

	wire [3:0] ram_gwen;
	assign ram_gwen = ((mem_valid && !mem_ready && mem_addr < 4*MEM_WORDS) ? mem_wstrb : 4'b0);

	assign ram_gwenb = ~ram_gwen;
	assign ram_wenb[7:0] = ram_gwen[0] ? 8'b0 : 8'b1111_1111;
	assign ram_wenb[15:8] = ram_gwen[1] ? 8'b0 : 8'b1111_1111;
	assign ram_wenb[23:16] = ram_gwen[2] ? 8'b0 : 8'b1111_1111;
	assign ram_wenb[31:24] = ram_gwen[3] ? 8'b0 : 8'b1111_1111;

	assign iomem_valid = mem_valid && (mem_addr[31:24] > 8'h 01);
	assign iomem_wstrb = mem_wstrb;
	assign iomem_addr = mem_addr;
	assign iomem_wdata = mem_wdata;

	wire    spimemio_cfgreg_sel = mem_valid && (mem_addr == 32'h 0200_0000);
    assign  spimemio_cfgreg_we = spimemio_cfgreg_sel ? mem_wstrb : 4'b 0000;

    wire    simpleuart_reg_div_sel = mem_valid && (mem_addr == 32'h 0200_0004);
    assign  simpleuart_div_we = simpleuart_reg_div_sel ? mem_wstrb : 4'b 0000;

    wire    simpleuart_reg_dat_sel = mem_valid && (mem_addr == 32'h 0200_0008);
    assign simpleuart_dat_we = simpleuart_reg_dat_sel ? mem_wstrb[0] : 1'b 0;
    assign simpleuart_dat_re = simpleuart_reg_dat_sel && !mem_wstrb;    

	assign mem_ready = (iomem_valid && iomem_ready) || spimem_ready || ram_ready || spimemio_cfgreg_sel ||
			simpleuart_reg_div_sel || (simpleuart_reg_dat_sel && !simpleuart_reg_dat_wait);

	assign mem_rdata = (iomem_valid && iomem_ready) ? iomem_rdata : spimem_ready ? spimem_rdata : ram_ready ? ram_rdata :
			spimemio_cfgreg_sel ? spimemio_cfgreg_do : simpleuart_reg_div_sel ? simpleuart_reg_div_do :
			simpleuart_reg_dat_sel ? simpleuart_reg_dat_do : 32'h 0000_0000;

    assign spimem_valid = mem_valid && mem_addr >= 4*MEM_WORDS && mem_addr < 32'h 0200_0000;            

endmodule
