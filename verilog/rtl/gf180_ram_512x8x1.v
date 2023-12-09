module gf180_ram_512x8x1 (
`ifdef USE_POWER_PINS
	inout VDD,
	inout VSS,
`endif    
    input   clk,
    input   cen,            // active high
    input   gwen,           // active low
    input   [7:0] wen,      // active low
    input   [8:0] addr,
    input   [7:0] wdata,
    output  [7:0] rdata
);

gf180mcu_fd_ip_sram__sram512x8m8wm1 ram_512x8x1 (
    .CLK    (clk),
    .CEN    (cen),      // active high
    .GWEN   (gwen),     // active low
    .WEN    (wen),      // active low
    .A      (addr),
    .D      (wdata),
    .Q      (rdata),
`ifdef USE_POWER_PINS
    .VDD    (VDD),
    .VSS    (VSS)
`endif
`ifndef USE_POWER_PINS
	.VDD(),
	.VSS()
`endif
);
endmodule



