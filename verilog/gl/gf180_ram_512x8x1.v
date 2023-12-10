module gf180_ram_512x8x1 (cen,
    clk,
    gwen,
    VDD,
    VSS,
    addr,
    rdata,
    wdata,
    wen);
 input cen;
 input clk;
 input gwen;
 input VDD;
 input VSS;
 input [8:0] addr;
 output [7:0] rdata;
 input [7:0] wdata;
 input [7:0] wen;


 gf180mcu_fd_ip_sram__sram512x8m8wm1 ram_512x8x1 (.CEN(cen),
    .CLK(clk),
    .GWEN(gwen),
    .VDD(VDD),
    .VSS(VSS),
    .A({addr[8],
    addr[7],
    addr[6],
    addr[5],
    addr[4],
    addr[3],
    addr[2],
    addr[1],
    addr[0]}),
    .D({wdata[7],
    wdata[6],
    wdata[5],
    wdata[4],
    wdata[3],
    wdata[2],
    wdata[1],
    wdata[0]}),
    .Q({rdata[7],
    rdata[6],
    rdata[5],
    rdata[4],
    rdata[3],
    rdata[2],
    rdata[1],
    rdata[0]}),
    .WEN({wen[7],
    wen[6],
    wen[5],
    wen[4],
    wen[3],
    wen[2],
    wen[1],
    wen[0]}));
endmodule
