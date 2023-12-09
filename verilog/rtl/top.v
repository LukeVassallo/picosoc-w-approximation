/*
 *  PicoSoC - A simple example SoC using PicoRV32
 *
 *  Copyright (C) 2017  Claire Xenia Wolf <claire@yosyshq.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

`ifdef PICOSOC_V
//`error "top.v must be read before picosoc.v!"
`endif

module top (
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif
	input clk,
	input resetn,

	output [7:0] leds,
	output ser_tx,
	input ser_rx,

	output flash_csb,
	output flash_clk,
	input [3:0] flash_io_di,
	output [3:0] flash_io_do,
	output [3:0] flash_io_oeb
);
	parameter integer MEM_WORDS = 512;

//	reg [5:0] reset_cnt = 0;
//	wire resetn = &reset_cnt;

//	always @(posedge clk) begin
//		reset_cnt <= reset_cnt + !resetn;
//	end

	wire        iomem_valid;
	reg         iomem_ready;
	wire [3:0]  iomem_wstrb;
	wire [31:0] iomem_addr;
	wire [31:0] iomem_wdata;
	reg  [31:0] iomem_rdata;

	reg [31:0] gpio;
	assign leds = gpio[7:0];

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

	wire [3:0] flash_io_oe;
	assign flash_io_oeb = ~flash_io_oe;

	reg [31:0] irq;
	wire irq_stall = 0;
	wire irq_uart = 0;

	always @* begin
		irq = 0;
		irq[3] = irq_stall;
		irq[4] = irq_uart;
		irq[5] = 1'b0;
		irq[6] = 1'b0;
		irq[7] = 1'b0;
	end

	wire mem_valid;
	wire mem_instr;
	wire mem_ready;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0] mem_wstrb;
	wire [31:0] mem_rdata;

	wire spimem_ready;
	wire [31:0] spimem_rdata;

	reg ram_ready;
	wire [31:0] ram_rdata;

	assign iomem_valid = mem_valid && (mem_addr[31:24] > 8'h 01);
	assign iomem_wstrb = mem_wstrb;
	assign iomem_addr = mem_addr;
	assign iomem_wdata = mem_wdata;

	wire spimemio_cfgreg_sel = mem_valid && (mem_addr == 32'h 0200_0000);
	wire [31:0] spimemio_cfgreg_do;

	wire        simpleuart_reg_div_sel = mem_valid && (mem_addr == 32'h 0200_0004);
	wire [31:0] simpleuart_reg_div_do;

	wire        simpleuart_reg_dat_sel = mem_valid && (mem_addr == 32'h 0200_0008);
	wire [31:0] simpleuart_reg_dat_do;
	wire        simpleuart_reg_dat_wait;

	assign mem_ready = (iomem_valid && iomem_ready) || spimem_ready || ram_ready || spimemio_cfgreg_sel ||
			simpleuart_reg_div_sel || (simpleuart_reg_dat_sel && !simpleuart_reg_dat_wait);

	assign mem_rdata = (iomem_valid && iomem_ready) ? iomem_rdata : spimem_ready ? spimem_rdata : ram_ready ? ram_rdata :
			spimemio_cfgreg_sel ? spimemio_cfgreg_do : simpleuart_reg_div_sel ? simpleuart_reg_div_do :
			simpleuart_reg_dat_sel ? simpleuart_reg_dat_do : 32'h 0000_0000;

	cpu cpu_inst_0 (
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif
		.clk         (clk        ),
		.resetn      (resetn     ),
		.mem_valid   (mem_valid  ),
		.mem_instr   (mem_instr  ),
		.mem_ready   (mem_ready  ),
		.mem_addr    (mem_addr   ),
		.mem_wdata   (mem_wdata  ),
		.mem_wstrb   (mem_wstrb  ),
		.mem_rdata   (mem_rdata  ),
		.irq(irq)
	);

	spimemio spimemio (
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif		
		.clk    (clk),
		.resetn (resetn),
		.valid  (mem_valid && mem_addr >= 4*MEM_WORDS && mem_addr < 32'h 0200_0000),
		.ready  (spimem_ready),
		.addr   (mem_addr[23:0]),
		.rdata  (spimem_rdata),

		.flash_csb    (flash_csb   ),
		.flash_clk    (flash_clk   ),

		// .flash_io0_oe (flash_io_oe[0]),
		// .flash_io1_oe (flash_io_oe[1]),
		// .flash_io2_oe (flash_io_oe[2]),
		// .flash_io3_oe (flash_io_oe[3]),
		.flash_io0_oeb (flash_io_oeb[0]),
		.flash_io1_oeb (flash_io_oeb[1]),
		.flash_io2_oeb (flash_io_oeb[2]),
		.flash_io3_oeb (flash_io_oeb[3]),

		.flash_io0_do (flash_io_do[0]),
		.flash_io1_do (flash_io_do[1]),
		.flash_io2_do (flash_io_do[2]),
		.flash_io3_do (flash_io_do[3]),

		.flash_io0_di (flash_io_di[0]),
		.flash_io1_di (flash_io_di[1]),
		.flash_io2_di (flash_io_di[2]),
		.flash_io3_di (flash_io_di[3]),

		.cfgreg_we(spimemio_cfgreg_sel ? mem_wstrb : 4'b 0000),
		.cfgreg_di(mem_wdata),
		.cfgreg_do(spimemio_cfgreg_do)
	);

		simpleuart simpleuart (
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif			
		.clk         (clk         ),
		.resetn      (resetn      ),

		.ser_tx      (ser_tx      ),
		.ser_rx      (ser_rx      ),

		.reg_div_we  (simpleuart_reg_div_sel ? mem_wstrb : 4'b 0000),
		.reg_div_di  (mem_wdata),
		.reg_div_do  (simpleuart_reg_div_do),

		.reg_dat_we  (simpleuart_reg_dat_sel ? mem_wstrb[0] : 1'b 0),
		.reg_dat_re  (simpleuart_reg_dat_sel && !mem_wstrb),
		.reg_dat_di  (mem_wdata),
		.reg_dat_do  (simpleuart_reg_dat_do),
		.reg_dat_wait(simpleuart_reg_dat_wait)
	);

	always @(posedge clk)
		ram_ready <= mem_valid && !mem_ready && mem_addr < 4*MEM_WORDS;

	wire [3:0] wen;
	wire [21:0] addr;
	wire [31:0] wdata;
	wire [31:0] rdata;

	assign wen = ((mem_valid && !mem_ready && mem_addr < 4*MEM_WORDS) ? mem_wstrb : 4'b0);
	assign addr = mem_addr[23:2];
	assign wdata = mem_wdata;
	assign ram_rdata = rdata;

gf180_ram_512x8x1 sram512x8_0 (
`ifdef USE_POWER_PINS
    .VDD    (vdd),
    .VSS    (vss),
`endif
    .clk(clk),
    .cen(~resetn),
    .gwen(wen[0] ? 1'b0 : 1'b1),
    .wen(wen[0] ? 8'b0 : 8'b1111_1111),
    .addr(addr[8:0]),
    .wdata(wdata[7:0]),
    .rdata(rdata[7:0])
);

gf180_ram_512x8x1 sram512x8_1 (
`ifdef USE_POWER_PINS
    .VDD    (vdd),
    .VSS    (vss),
`endif
    .clk(clk),
    .cen(~resetn),
    .gwen(wen[1] ? 1'b0 : 1'b1),
    .wen(wen[1] ? 8'b0 : 8'b1111_1111),
    .addr(addr[8:0]),
    .wdata(wdata[15:8]),
    .rdata(rdata[15:8])
);

gf180_ram_512x8x1 sram512x8_2 (
`ifdef USE_POWER_PINS
    .VDD    (vdd),
    .VSS    (vss),
`endif
    .clk(clk),
    .cen(~resetn),
    .gwen(wen[2] ? 1'b0 : 1'b1),
    .wen(wen[2] ? 8'b0 : 8'b1111_1111),
    .addr(addr[8:0]),
    .wdata(wdata[23:16]),
    .rdata(rdata[23:16])
);

gf180_ram_512x8x1 sram512x8_3 (
`ifdef USE_POWER_PINS
    .VDD    (vdd),
    .VSS    (vss),
`endif
    .clk(clk),
    .cen(~resetn),
    .gwen(wen[3] ? 1'b0 : 1'b1),
    .wen(wen[3] ? 8'b0 : 8'b1111_1111),
    .addr(addr[8:0]),    
    .wdata(wdata[31:24]),
    .rdata(rdata[31:24])
);

endmodule
