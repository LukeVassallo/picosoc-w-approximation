// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

//`default_nettype none
`define MPRJ_IO_PADS_1 19	/* number of user GPIO pads on user1 side */
`define MPRJ_IO_PADS_2 19	/* number of user GPIO pads on user2 side */
`define MPRJ_IO_PADS (`MPRJ_IO_PADS_1 + `MPRJ_IO_PADS_2)

`define MPRJ_PWR_PADS_1 2	/* vdda1, vccd1 enable/disable control */
`define MPRJ_PWR_PADS_2 2	/* vdda2, vccd2 enable/disable control */
`define MPRJ_PWR_PADS (`MPRJ_PWR_PADS_1 + `MPRJ_PWR_PADS_2)

/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdd,		// User area 5.0V supply
    inout vss,		// User area ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [63:0] la_data_in,
    output [63:0] la_data_out,
    input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/
	// rst
	wire reset, resetn;

	// cpu to interconnect
	wire mem_valid;
	wire mem_instr;
	wire mem_ready;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0] mem_wstrb;
	wire [31:0] mem_rdata;

	// spi
	wire spimem_ready;
	wire [31:0] spimem_rdata;
	wire [3:0] spimemio_cfgreg_we;
	wire [31:0] spimemio_cfgreg_do;
	wire spimem_valid;	
	
	// simple uart
	wire [3:0] simpleuart_div_we;
	wire [31:0] simpleuart_reg_div_do;

	wire simpleuart_dat_we;
	wire simpleuart_dat_re;
	wire [31:0] simpleuart_reg_dat_do;
	wire simpleuart_reg_dat_wait;

	// SRAM
	wire [31:0] ram_rdata;
	wire [3:0] ram_gwenb;
	wire [31:0] ram_wenb;


	wire pcpi_valid;
	wire [31:0] pcpi_insn;
	wire [31:0] pcpi_rs1;
	wire [31:0] pcpi_rs2;
	wire pcpi_wr;
	wire [31:0] pcpi_rd;
	wire pcpi_wait;
	wire pcpi_ready;

	cpu cpu_inst_0 (
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif
		.clk         (io_in[8]        ),
		.resetn      (resetn     ),
		.mem_valid   (mem_valid  ),
		.mem_instr   (mem_instr  ),
		.mem_ready   (mem_ready  ),
		.mem_addr    (mem_addr   ),
		.mem_wdata   (mem_wdata  ),
		.mem_wstrb   (mem_wstrb  ),
		.mem_rdata   (mem_rdata  ),

		.irq_in(io_in[21:18]),
		.irq_out(io_out[21:18]),
		.irq_oeb(io_oeb[21:18]),

		.pcpi_valid(pcpi_valid),
	 	.pcpi_insn(pcpi_insn),
		.pcpi_rs1(pcpi_rs1),
		.pcpi_rs2(pcpi_rs2),
		// .pcpi_wr(pcpi_wr),
		// .pcpi_rd(pcpi_rd),
		// .pcpi_wait(pcpi_wait),
		// .pcpi_ready(pcpi_ready),

		// picorv32 mul
		.pcpi_mul_wr(pcpi_mul_wr),
		.pcpi_mul_rd(pcpi_mul_rd),
		.pcpi_mul_wait(pcpi_mul_wait),
		.pcpi_mul_ready(pcpi_mul_ready),

		// picorv32 div
		.pcpi_div_wr(pcpi_div_wr),
		.pcpi_div_rd(pcpi_div_rd),
		.pcpi_div_wait(pcpi_div_wait),
		.pcpi_div_ready(pcpi_div_ready),

		.pcpi_exact_mul_wr(pcpi_exact_mul_wr),
		.pcpi_exact_mul_rd(pcpi_exact_mul_rd),
		.pcpi_exact_mul_wait(pcpi_exact_mul_wait),
		.pcpi_exact_mul_ready(pcpi_exact_mul_ready),

		.pcpi_approx_mul_wr(pcpi_approx_mul_wr),
		.pcpi_approx_mul_rd(pcpi_approx_mul_rd),
		.pcpi_approx_mul_wait(pcpi_approx_mul_wait),
	    .pcpi_approx_mul_ready(pcpi_approx_mul_ready)	
	);

	wire pcpi_exact_mul_wr, pcpi_approx_mul_wr;
	wire [31:0] pcpi_exact_mul_rd, pcpi_approx_mul_rd;
	wire pcpi_exact_mul_wait, pcpi_approx_mul_wait;
	wire pcpi_exact_mul_ready, pcpi_approx_mul_ready;

	simple_interconnect simple_interconnect_inst_0(
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif		
		.clk(io_in[8]),
		.resetn(resetn),

		.gpio_in(io_in[37:22]),
		.gpio_out(io_out[37:22]),
		.gpio_oeb(io_oeb[37:22]),

		.mem_valid(mem_valid),
		.mem_instr(mem_instr),
		.mem_ready(mem_ready),

		.mem_addr(mem_addr),
		.mem_wdata(mem_wdata),
		.mem_wstrb(mem_wstrb),
		.mem_rdata(mem_rdata),

    	.spimem_ready(spimem_ready),
		.spimem_valid(spimem_valid),
		.spimem_rdata(spimem_rdata),
		.spimemio_cfgreg_we(spimemio_cfgreg_we),
		.spimemio_cfgreg_do(spimemio_cfgreg_do),

		.simpleuart_div_we(simpleuart_div_we),
		.simpleuart_reg_div_do(simpleuart_reg_div_do),

		.simpleuart_dat_we(simpleuart_dat_we),
		.simpleuart_dat_re(simpleuart_dat_re),

		.simpleuart_reg_dat_do(simpleuart_reg_dat_do),
		.simpleuart_reg_dat_wait(simpleuart_reg_dat_wait),

		.ram_rdata(ram_rdata),
		.ram_wenb(ram_wenb),
		.ram_gwenb(ram_gwenb)

);

	spimemio spimemio (
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif		
		.clk    (io_in[8]),
		.resetn (resetn),
		.valid  (spimem_valid),
		.ready  (spimem_ready),
		.addr   (mem_addr[23:0]),
		.rdata  (spimem_rdata),

		// 15: io[3]
		// ...
		// 12: io[0]
		// 11: flash_clk
		// 10: flash_csb
		.flash_in(io_in[15:10]),
		.flash_out(io_out[15:10]),
		.flash_oeb(io_oeb[15:10]),

		.cfgreg_we(spimemio_cfgreg_we),
		.cfgreg_di(mem_wdata),
		.cfgreg_do(spimemio_cfgreg_do)
	);

		simpleuart simpleuart (
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif			
		.clk         (io_in[8]    ),
		.resetn      (resetn      ),

		.uart_in(io_in[17:16]),
		.uart_out(io_out[17:16]),
		.uart_oeb(io_oeb[17:16]),

		.reg_div_we  (simpleuart_div_we),
		.reg_div_di  (mem_wdata),
		.reg_div_do  (simpleuart_reg_div_do),

		.reg_dat_we  (simpleuart_dat_we),
		.reg_dat_re  (simpleuart_dat_re),
		.reg_dat_di  (mem_wdata),
		.reg_dat_do  (simpleuart_reg_dat_do),
		.reg_dat_wait(simpleuart_reg_dat_wait)
	);

ctrl ctrl_inst_0 (
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif
		// .nc_in(io_in[7:0]),
		// .nc_out(io_out[7:0]),
		// .nc_oeb(io_oeb[7:0]),

		.ctrl_in(io_in[9:8]),
		.ctrl_out(io_out[9:8]),
		.ctrl_oeb(io_oeb[9:8]),

		.resetn(resetn),
		.reset(reset)		
);

// 7series_bram_512x32x1
//blk_mem_gen_0 blk_mem_gen_0_inst_0(
//    .clka(io_in[8]),    // input wire clka
//    .ena(1'b1),      // input wire ena
//    .wea({~ram_wenb[24], ~ram_wenb[16], ~ram_wenb[8], ~ram_wenb[0]}),      // input wire [3 : 0] wea
//    .addra(mem_addr[10:2]),  // input wire [8 : 0] addra
//    .dina(mem_wdata),    // input wire [31 : 0] dina
//    .douta(ram_rdata)  // output wire [31 : 0] douta
//);

picosoc_mem #(
	.WORDS(512),
	.firmware("firmware.hex")
) picosoc_mem_inst_0 (
	.clk(io_in[8]),
	.wen({~ram_wenb[24], ~ram_wenb[16], ~ram_wenb[8], ~ram_wenb[0]}),
	.addr(mem_addr[10:2]),
	.wdata(mem_wdata),
	.rdata(ram_rdata)
);

// gf180_ram_512x8x1 sram512x8_0 (
// `ifdef USE_POWER_PINS
//     .VDD    (vdd),
//     .VSS    (vss),
// `endif
//     .clk(io_in[8]),
//     .cen(reset),
//     .gwen(ram_gwenb[0]),
//     .wen(ram_wenb[7:0]),
//     .addr(mem_addr[10:2]),
//     .wdata(mem_wdata[7:0]),
//     .rdata(ram_rdata[7:0])
// );

// gf180_ram_512x8x1 sram512x8_1 (
// `ifdef USE_POWER_PINS
//     .VDD    (vdd),
//     .VSS    (vss),
// `endif
//     .clk(io_in[8]),
//     .cen(reset),
//     .gwen(ram_gwenb[1]),
//     .wen(ram_wenb[15:8]),
//     .addr(mem_addr[10:2]),
//     .wdata(mem_wdata[15:8]),
//     .rdata(ram_rdata[15:8])
// );

// gf180_ram_512x8x1 sram512x8_2 (
// `ifdef USE_POWER_PINS
//     .VDD    (vdd),
//     .VSS    (vss),
// `endif
//     .clk(io_in[8]),
//     .cen(reset),
//     .gwen(ram_gwenb[2]),
//     .wen(ram_wenb[23:16]),
//     .addr(mem_addr[10:2]),
//     .wdata(mem_wdata[23:16]),
//     .rdata(ram_rdata[23:16])
// );

// gf180_ram_512x8x1 sram512x8_3 (
// `ifdef USE_POWER_PINS
//     .VDD    (vdd),
//     .VSS    (vss),
// `endif
//     .clk(io_in[8]),
//     .cen(reset),
// 	.gwen(ram_gwenb[3]),
//     .wen(ram_wenb[31:24]),
//     .addr(mem_addr[10:2]),    
//     .wdata(mem_wdata[31:24]),
//     .rdata(ram_rdata[31:24])
// );

wire pcpi_mul_wr;
wire [31:0] pcpi_mul_rd;
wire pcpi_mul_wait;
wire pcpi_mul_ready;

pcpi_mul pcpi_mul_inst_0 (
		`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif
	.clk(io_in[8]),
	.resetn(resetn),
	.pcpi_mul_valid(pcpi_valid),
	.pcpi_insn(pcpi_insn),
	.pcpi_rs1(pcpi_rs1),
	.pcpi_rs2(pcpi_rs2),
	.pcpi_mul_wr(pcpi_mul_wr),
	.pcpi_mul_rd(pcpi_mul_rd),
	.pcpi_mul_wait(pcpi_mul_wait),
	.pcpi_mul_ready(pcpi_mul_ready)
);

wire pcpi_div_wr;
wire [31:0] pcpi_div_rd;
wire pcpi_div_wait;
wire pcpi_div_ready;

pcpi_div pcpi_div_inst_0 (
		`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif
	.clk(io_in[8]),
	.resetn(resetn),
	.pcpi_div_valid(pcpi_valid),
	.pcpi_insn(pcpi_insn),
	.pcpi_rs1(pcpi_rs1),
	.pcpi_rs2(pcpi_rs2),
	.pcpi_div_wr(pcpi_div_wr),
	.pcpi_div_rd(pcpi_div_rd),
	.pcpi_div_wait(pcpi_div_wait),
	.pcpi_div_ready(pcpi_div_ready)
);

pcpi_exact_mul pcpi_exact_mul_inst_0(
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif

 	.clk(io_in[8]),
	.resetn(resetn),
	.pcpi_valid(pcpi_valid),
	.pcpi_insn(pcpi_insn),
	.pcpi_rs1(pcpi_rs1),
	.pcpi_rs2(pcpi_rs2),
	.pcpi_wr(pcpi_exact_mul_wr),
	.pcpi_rd(pcpi_exact_mul_rd),
	.pcpi_wait(pcpi_exact_mul_wait),
	.pcpi_ready(pcpi_exact_mul_ready)    
);

pcpi_approx_mul pcpi_approx_mul_inst_0(
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif

 	.clk(io_in[8]),
	.resetn(resetn),
	.pcpi_valid(pcpi_valid),
	.pcpi_insn(pcpi_insn),
	.pcpi_rs1(pcpi_rs1),
	.pcpi_rs2(pcpi_rs2),
	.pcpi_wr(pcpi_approx_mul_wr),
	.pcpi_rd(pcpi_approx_mul_rd),
	.pcpi_wait(pcpi_approx_mul_wait),
	.pcpi_ready(pcpi_approx_mul_ready)    
);

user_proj_example user_proj_example_inst_0 (
	`ifdef USE_POWER_PINS
		.vdd    (vdd),
		.vss    (vss),
	`endif

    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    // MGMT SoC Wishbone Slave

    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o),

    // Logic Analyzer

    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb (la_oenb),

    // IO Pads

    .io_in (io_in[7:0]),
    .io_out(io_out[7:0]),
    .io_oeb(io_oeb[7:0]),

    // IRQ
    .irq(user_irq)
);

endmodule	// user_project_wrapper

module picosoc_mem #(
	parameter integer WORDS = 256,
	parameter firmware = "firmware.hex"
) (
	input clk,
	input [3:0] wen,
	input [21:0] addr,
	input [31:0] wdata,
	output reg [31:0] rdata
);
	reg [31:0] mem [0:WORDS-1];
        reg [1023:0] firmware_file;
        
	initial begin
		$readmemh(firmware, mem);
	end

	always @(posedge clk) begin
		rdata <= mem[addr];
		if (wen[0]) mem[addr][ 7: 0] <= wdata[ 7: 0];
		if (wen[1]) mem[addr][15: 8] <= wdata[15: 8];
		if (wen[2]) mem[addr][23:16] <= wdata[23:16];
		if (wen[3]) mem[addr][31:24] <= wdata[31:24];
	end
endmodule

//`default_nettype wire
