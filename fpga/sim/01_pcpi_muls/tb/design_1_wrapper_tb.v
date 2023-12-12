`timescale 1ns / 1ps

module design_1_wrapper_tb;

  reg clk;
  reg aresetn;
  reg pcpi_valid;
  reg [31:0] pcpi_insn_a;
  reg [31:0] pcpi_insn_b;
  reg [31:0] pcpi_insn_c;
  reg [31:0] pcpi_insn_d;

  
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Generates a 100MHz clock
  end

//  wire [6:0] func7 = 7'b0;
  wire [4:0] rs1 = 5'b0;
  wire [4:0] rs2 = 5'b0;
  wire [4:0] rd = 5'b0;
  wire [2:0] func3 = 3'b0;
  wire [6:0] opcode = 7'b000_1011;


  // Reset generation
  initial begin
    aresetn = 0; // Active-low reset
    pcpi_valid = 0;
    pcpi_insn_a = {7'b0, rs2, rs1, func3, rd, opcode};
    pcpi_insn_b = {7'b1, rs2, rs1, func3, rd, opcode};
    pcpi_insn_c = {7'b10, rs2, rs1, func3, rd, opcode};
    pcpi_insn_d = {7'b11, rs2, rs1, func3, rd, opcode};

    #10 aresetn = 1;
    #2000 pcpi_valid = 1;
    #655350     
    pcpi_insn_a = {7'b0, rs2, rs1, 3'b1, rd, opcode};
    pcpi_insn_b = {7'b1, rs2, rs1, 3'b1, rd, opcode};
    pcpi_insn_c = {7'b10, rs2, rs1, 3'b1, rd, opcode};
    pcpi_insn_d = {7'b11, rs2, rs1, 3'b1, rd, opcode};
    #655350     
    pcpi_insn_a = {7'b0, rs2, rs1, 3'b10, rd, opcode};
    pcpi_insn_b = {7'b1, rs2, rs1, 3'b10, rd, opcode};
    pcpi_insn_c = {7'b10, rs2, rs1, 3'b10, rd, opcode};
    pcpi_insn_d = {7'b11, rs2, rs1, 3'b10, rd, opcode};
    
    $finish;
    
  end

  // Add your test code here
  design_1_wrapper design_1_wrapper_inst_0 (
    .clk(clk),
    .aresetn(aresetn),
    .pcpi_valid(pcpi_valid),
    .pcpi_insn_a(pcpi_insn_a),
    .pcpi_insn_b(pcpi_insn_b),
    .pcpi_insn_c(pcpi_insn_c),
    .pcpi_insn_d(pcpi_insn_d)
    );
endmodule
