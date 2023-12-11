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

`default_nettype none

`timescale 1 ns / 1 ps

`include "w25q128.v"

module bootloader_user_wrapper_wo_caravel_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	localparam ser_half_period = 53;
	event ser_sample;
	reg [7:0] buffer;

	always begin
		@(negedge ser_tx);

		repeat (ser_half_period) @(posedge clock);
		-> ser_sample; // start bit

		repeat (8) begin
			repeat (ser_half_period) @(posedge clock);
			repeat (ser_half_period) @(posedge clock);
			buffer = {ser_tx, buffer[7:1]};
			-> ser_sample; // data bit
		end

		repeat (ser_half_period) @(posedge clock);
		repeat (ser_half_period) @(posedge clock);
		-> ser_sample; // stop bit

		if (buffer < 32 || buffer >= 127)
			$display("Serial data: %d", buffer);
		else
			$display("Serial data: '%c'", buffer);
	end

	// External clock is used by default.  Make this artificially fast for the
	// simulation.  Normally this would be a slow clock and the digital PLL
	// would be the fast clock.

	always #5 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	initial begin
		$dumpfile("bootloader_user_wrapper_wo_caravel.vcd");
		$dumpvars(0, bootloader_user_wrapper_wo_caravel_tb);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (10) begin
			repeat (50000) @(posedge clock);
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test Mega-Project IO Ports (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test Mega-Project IO Ports (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#300_000;
		CSB = 1'b0;		// CSB can be released
	end

	initial begin			// Power-up
		power1 <= 1'b0;
		#200;
		power1 <= 1'b1;
	end

	wire VDD5V0;
	wire VSS;

	assign VDD5V0 = power1;
	assign VSS = 1'b0;

	reg design_rst;
	reg design_rstn;

	wire flash_csb;
	wire flash_clk;
	wire [15:0] leds;
	wire [3:0] flash_io_oe;
	wire [3:0] flash_io_oeb;
	wire [3:0] flash_io_do;
	wire [3:0] flash_io_di;
	wire flash_io0;
	wire flash_io1;
	wire flash_io2;
	wire flash_io3;

	assign flash_io_oe = ~flash_io_oeb;

	bidirec bidirec_inst_3 (.oe(flash_io_oe[3]), .inp(flash_io_do[3]), .outp(flash_io_di[3]), .bidir(flash_io3) );
	bidirec bidirec_inst_2 (.oe(flash_io_oe[2]), .inp(flash_io_do[2]), .outp(flash_io_di[2]), .bidir(flash_io2) );
	bidirec bidirec_inst_1 (.oe(flash_io_oe[1]), .inp(flash_io_do[1]), .outp(flash_io_di[1]), .bidir(flash_io1) );
	bidirec bidirec_inst_0 (.oe(flash_io_oe[0]), .inp(flash_io_do[0]), .outp(flash_io_di[0]), .bidir(flash_io0) );

	wire ser_rx;
	wire ser_tx;

	wire [37:0] io_in;
    wire [37:0] io_out;
    wire [37:0] io_oeb;

	assign io_in[8] = clock;
	assign io_in[9] = design_rstn;
	assign flash_csb = io_out[10];
	assign flash_clk = io_out[11];
	assign leds = io_out[37:22];
	assign ser_tx = io_out[16];
	assign io_in[17] = ser_rx;

	assign flash_io_do = io_out[15:12];
	assign flash_io_oeb = io_oeb[15:12];
	assign io_in[15:12] = flash_io_di;


	user_project_wrapper uut (
		.vdd	  (VDD5V0),
		.vss      (VSS),		
		.io_in (io_in),
		.io_out (io_out),
		.io_oeb (io_oeb)
	);

	w25q128 #(
		.firmware("./fw/app_02/bin/firmware.hex") 
	) w25q128_inst_0 (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(flash_io2),
		.io3(flash_io3)
	);	

	initial begin
		design_rstn <= 0;
		design_rst <= 1;
		#1_000_000
		$display("Releasing reset ... ");
		design_rstn <= 1;
		design_rst <= 0;
	end

endmodule

`default_nettype wire