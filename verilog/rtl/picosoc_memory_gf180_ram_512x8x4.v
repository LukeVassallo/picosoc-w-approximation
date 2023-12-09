module picosoc_memory_gf180_ram512x8x4 (
`ifdef USE_POWER_PINS
	inout vdd,
	inout vss,
`endif
	input CLK,
	input CEN,
	input [3:0] WEN,
	input [8:0] A,
	input [31:0] D,
	output [31:0] Q
);

gf180_ram_512x8x1 sram512x8_0 (
`ifdef USE_POWER_PINS
    .VDD    (vdd),
    .VSS    (vss),
`endif
    .clk(CLK),
    .cen(CEN),
    .gwen(WEN[0]),
    .wen(WEN[0] ? 8'b1111_1111 : 8'b0),
    .addr(A),
    .wdata(D[7:0]),
    .rdata(Q[7:0])
);

gf180_ram_512x8x1 sram512x8_1 (
`ifdef USE_POWER_PINS
    .VDD    (vdd),
    .VSS    (vss),
`endif
    .clk(CLK),
    .cen(CEN),
    .gwen(WEN[1]),
    .wen(WEN[1] ? 8'b1111_1111 : 8'b0),
    .addr(A),
    .wdata(D[15:8]),
    .rdata(Q[15:8])
);

gf180_ram_512x8x1 sram512x8_2 (
`ifdef USE_POWER_PINS
    .VDD    (vdd),
    .VSS    (vss),
`endif
    .clk(CLK),
    .cen(CEN),
    .gwen(WEN[2]),
    .wen(WEN[2] ? 8'b1111_1111 : 8'b0),
    .addr(A),
    .wdata(D[23:16]),
    .rdata(Q[23:16])
);

gf180_ram_512x8x1 sram512x8_3 (
`ifdef USE_POWER_PINS
    .VDD    (vdd),
    .VSS    (vss),
`endif
    .clk(CLK),
    .cen(CEN),
    .gwen(WEN[3]),
    .wen(WEN[3] ? 8'b1111_1111 : 8'b0),
    .addr(A),    
    .wdata(D[31:24]),
    .rdata(Q[31:24])
);

endmodule
