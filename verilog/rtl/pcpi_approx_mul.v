module pcpi_approx_mul (
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
    
//    reg instr_mul, instr_mulh, instr_mulhsu, instr_mulhu;
    // instr_mul_d : dual 8-bit multiplication using [15:8] and [7:0] from the source registers and writing 16-bit results in [31:16] and [15:0]
    // instr_mul_q_l : quad 8-bit multiplication using [31:24] ... [7:0] from the source registers and writing lower 8-bit of 16-bit results in [31:24] ...  [7:0]
    // instr_mul_q_h : quad 8-bit multiplication using [31:24] ... [7:0] from the source registers and writing upper 8-bit of 16-bit results in [31:24] ...  [7:0]
//    reg instr_mul_d, instr_mul_q_l, instr_mul_q_h;

//	wire instr_any_mul = |{instr_mul_d, instr_mul_q_l, instr_mul_q_h};
//	wire instr_any_mulh = |{instr_mulh, instr_mulhsu, instr_mulhu};
//	wire instr_rs1_signed = |{instr_mulh, instr_mulhsu};
//	wire instr_rs2_signed = |{instr_mulh};

	
    wire active = pcpi_valid && pcpi_insn[6:0] == 7'b000_1011 && pcpi_insn[31:25] == 7'b000_0001;
    
    wire [15:0] resultX_0;
    wire [15:0] resultX_1;
    wire [15:0] resultX_2;
    wire [15:0] resultX_3;
    
    always @(posedge clk) begin      
        if (active) begin
            pcpi_rd =   (pcpi_insn[14:12] == 3'b000) ? {resultX_1, resultX_0} : 
                        (pcpi_insn[14:12] == 3'b001) ? {resultX_3[7:0], resultX_2[7:0], resultX_1[7:0], resultX_0[7:0] } : 
                        (pcpi_insn[14:12] == 3'b010) ? {resultX_3[15:8], resultX_2[15:8], resultX_1[15:8], resultX_0[15:8] } : 
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
    
   SCDM8_51 SCDM8_51_inst_0 (
    .c(pcpi_rs1[7:0]),
    .d(pcpi_rs2[7:0]),
    .resultX(resultX_0)
    );
    
   SCDM8_51 SCDM8_51_inst_1 (
    .c(pcpi_rs1[15:8]),
    .d(pcpi_rs2[15:8]),
    .resultX(resultX_1)
    );
    
   SCDM8_51 SCDM8_51_inst_2 (
    .c(pcpi_rs1[23:16]),
    .d(pcpi_rs2[23:16]),
    .resultX(resultX_2)
    );
    
   SCDM8_51 SCDM8_51_inst_3 (
    .c(pcpi_rs1[31:24]),
    .d(pcpi_rs2[31:24]),
    .resultX(resultX_3)
    );     
   
   endmodule
