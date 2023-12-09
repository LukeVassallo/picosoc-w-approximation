module pcpi_exact_mul (
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif	
    
    input clk, resetn,

	input             pcpi_valid,
	input      [31:0] pcpi_insn,
	input      [31:0] pcpi_rs1,
	input      [31:0] pcpi_rs2,
	output reg        pcpi_wr,
	output reg [31:0] pcpi_rd,
    //output     [31:0] pcpi_rd,
	output reg        pcpi_wait,
	output reg        pcpi_ready
    
    );
    
    // reg instr_mul, instr_mulh, instr_mulhsu, instr_mulhu;
    // instr_mul_d : dual 8-bit multiplication using [15:8] and [7:0] from the source registers and writing 16-bit results in [31:16] and [15:0]
    // instr_mul_q_l : quad 8-bit multiplication using [31:24] ... [7:0] from the source registers and writing lower 8-bit of 16-bit results in [31:24] ...  [7:0]
    // instr_mul_q_h : quad 8-bit multiplication using [31:24] ... [7:0] from the source registers and writing upper 8-bit of 16-bit results in [31:24] ...  [7:0]
    // reg instr_mul_d, instr_mul_q_l, instr_mul_q_h;

	// wire instr_any_mul = |{instr_mul_d, instr_mul_q_l, instr_mul_q_h};
//	wire instr_any_mulh = |{instr_mulh, instr_mulhsu, instr_mulhu};
//	wire instr_rs1_signed = |{instr_mulh, instr_mulhsu};
//	wire instr_rs2_signed = |{instr_mulh};

	
    wire active = pcpi_valid && pcpi_insn[6:0] == 7'b000_1011 && pcpi_insn[31:25] == 7'b000_0000;
    
    wire [15:0] result_0;
    wire [15:0] result_1;
    wire [15:0] result_2;
    wire [15:0] result_3;
    
    // assign pcpi_rd = (pcpi_insn[14:12] == 3'b000) ? {result_1, result_0} : 
    // (pcpi_insn[14:12] == 3'b001) ? {result_3[7:0], result_2[7:0], result_1[7:0], result_0[7:0] } : 
    // (pcpi_insn[14:12] == 3'b010) ? {result_3[15:8], result_2[15:8], result_1[15:8], result_0[15:8] } : 
    // 32'b0;    

    always @(posedge clk) begin      
        if (active) begin
            pcpi_rd =   (pcpi_insn[14:12] == 3'b000) ? {result_1, result_0} : 
                        (pcpi_insn[14:12] == 3'b001) ? {result_3[7:0], result_2[7:0], result_1[7:0], result_0[7:0] } : 
                        (pcpi_insn[14:12] == 3'b010) ? {result_3[15:8], result_2[15:8], result_1[15:8], result_0[15:8] } : 
                        32'b0;        
        end
    end 
    
    always @(posedge clk) begin
        pcpi_ready <= 0;
        pcpi_wr <= 0;
        pcpi_wait <= 0;
        
        if (active) begin
                pcpi_ready <= 1;
                pcpi_wr <= 1;
        end
    end  
    
   S_Exact8 S_Exact8_inst_0 (
    .c(pcpi_rs1[7:0]),
    .d(pcpi_rs2[7:0]),
    .result(result_0)
    );
    
   S_Exact8 S_Exact8_inst_1 (
    .c(pcpi_rs1[15:8]),
    .d(pcpi_rs2[15:8]),
    .result(result_1)
    );
    
   S_Exact8 S_Exact8_inst_2 (
    .c(pcpi_rs1[23:16]),
    .d(pcpi_rs2[23:16]),
    .result(result_2)
    );
    
   S_Exact8 S_Exact8_inst_3 (
    .c(pcpi_rs1[31:24]),
    .d(pcpi_rs2[31:24]),
    .result(result_3)
    );     
   
   endmodule
