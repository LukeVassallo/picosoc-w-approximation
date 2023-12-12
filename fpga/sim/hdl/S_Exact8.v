module S_Exact8(c,d,result);

	input  [7:0]  c;
	input  [7:0]  d;
	output [15:0] result;
	
	wire w0  [7:0];
	wire w11 [7:0];
	wire w12 [7:0];
	wire w13 [7:0];
	wire w14 [7:0];
	wire w21 [7:0];
	wire w22 [7:0];
	wire w23 [7:0];
	wire w24 [7:0];
	wire w31 [7:0];
	wire w32 [7:0];
	wire w33 [7:0];
	wire w34 [7:0];
	
	wire w41 [7:0];
	wire w42 [7:0];
	wire w43 [7:0];
	wire w44 [7:0];
	wire w51 [7:0];
	wire w52 [7:0];
	wire w53 [7:0];
	wire w54 [7:0];
	wire w61 [7:0];
	wire w62 [7:0];
	wire w63 [7:0];
	wire w64 [7:0];
	wire w71 [7:0];
	wire w72 [7:0];
	wire w73 [7:0];
	wire w74 [7:0];
	
	
	//row0
	 and(w0[0],c[0],d[0]);
	 and(w0[1],c[1],d[0]);
	 and(w0[2],c[2],d[0]);
	 and(w0[3],c[3],d[0]);
	 and(w0[4],c[4],d[0]);
	 and(w0[5],c[5],d[0]);
	 and(w0[6],c[6],d[0]);
	nand(w0[7],c[7],d[0]);
	
	assign result[0] = w0[0];
	
	//ppu of row1
	ppu  p10(c[0],d[1]  ,1'b0  ,w0[1],w13[0],w11[0],w12[0],w14[0]);
	ppu  p11(c[1],w11[0],w12[0],w0[2],w13[1],w11[1],w12[1],w14[1]);
	ppu  p12(c[2],w11[1],w12[1],w0[3],w13[2],w11[2],w12[2],w14[2]);
	ppu  p13(c[3],w11[2],w12[2],w0[4],w13[3],w11[3],w12[3],w14[3]);
	ppu  p14(c[4],w11[3],w12[3],w0[5],w13[4],w11[4],w12[4],w14[4]);
	ppu  p15(c[5],w11[4],w12[4],w0[6],w13[5],w11[5],w12[5],w14[5]);
	ppu  p16(c[6],w11[5],w12[5],w0[7],w13[6],w11[6],w12[6],w14[6]);
	SPPU p17(c[7],w11[6],w12[6],1'b1 ,w13[7],w11[7],w12[7],w14[7]);
	
	assign result[1] = w14[0];
	
	//ppu of row2
	ppu  p20(w13[0],d[2]  ,1'b0  ,w14[1],w23[0],w21[0],w22[0],w24[0]);
	ppu  p21(w13[1],w21[0],w22[0],w14[2],w23[1],w21[1],w22[1],w24[1]);	
	ppu  p22(w13[2],w21[1],w22[1],w14[3],w23[2],w21[2],w22[2],w24[2]);
	ppu  p23(w13[3],w21[2],w22[2],w14[4],w23[3],w21[3],w22[3],w24[3]);
	ppu  p24(w13[4],w21[3],w22[3],w14[5],w23[4],w21[4],w22[4],w24[4]);
	ppu  p25(w13[5],w21[4],w22[4],w14[6],w23[5],w21[5],w22[5],w24[5]);
	ppu  p26(w13[6],w21[5],w22[5],w14[7],w23[6],w21[6],w22[6],w24[6]);
	SPPU p27(w13[7],w21[6],w22[6],w12[7],w23[7],w21[7],w22[7],w24[7]);
	
	assign result[2] = w24[0];
	
	//ppu of row3
	ppu  p30(w23[0],d[3]  ,1'b0  ,w24[1],w33[0],w31[0],w32[0],w34[0]);
	ppu  p31(w23[1],w31[0],w32[0],w24[2],w33[1],w31[1],w32[1],w34[1]);
	ppu  p32(w23[2],w31[1],w32[1],w24[3],w33[2],w31[2],w32[2],w34[2]);
	ppu  p33(w23[3],w31[2],w32[2],w24[4],w33[3],w31[3],w32[3],w34[3]);
	ppu  p34(w23[4],w31[3],w32[3],w24[5],w33[4],w31[4],w32[4],w34[4]);
	ppu  p35(w23[5],w31[4],w32[4],w24[6],w33[5],w31[5],w32[5],w34[5]);
	ppu  p36(w23[6],w31[5],w32[5],w24[7],w33[6],w31[6],w32[6],w34[6]);
	SPPU p37(w23[7],w31[6],w32[6],w22[7],w33[7],w31[7],w32[7],w34[7]);
	
	assign result[3]  = w34[0];
	
	//ppu of row4
	ppu  p40(w33[0],d[4]  ,1'b0  ,w34[1],w43[0],w41[0],w42[0],w44[0]);
	ppu  p41(w33[1],w41[0],w42[0],w34[2],w43[1],w41[1],w42[1],w44[1]);
	ppu  p42(w33[2],w41[1],w42[1],w34[3],w43[2],w41[2],w42[2],w44[2]);
	ppu  p43(w33[3],w41[2],w42[2],w34[4],w43[3],w41[3],w42[3],w44[3]);
	ppu  p44(w33[4],w41[3],w42[3],w34[5],w43[4],w41[4],w42[4],w44[4]);
	ppu  p45(w33[5],w41[4],w42[4],w34[6],w43[5],w41[5],w42[5],w44[5]);
	ppu  p46(w33[6],w41[5],w42[5],w34[7],w43[6],w41[6],w42[6],w44[6]);
	SPPU p47(w33[7],w41[6],w42[6],w32[7],w43[7],w41[7],w42[7],w44[7]);
	
	assign result[4]  = w44[0];
	
	//ppu of row5
	ppu  p50(w43[0],d[5]  ,1'b0  ,w44[1],w53[0],w51[0],w52[0],w54[0]);
	ppu  p51(w43[1],w51[0],w52[0],w44[2],w53[1],w51[1],w52[1],w54[1]);
	ppu  p52(w43[2],w51[1],w52[1],w44[3],w53[2],w51[2],w52[2],w54[2]);
	ppu  p53(w43[3],w51[2],w52[2],w44[4],w53[3],w51[3],w52[3],w54[3]);
	ppu  p54(w43[4],w51[3],w52[3],w44[5],w53[4],w51[4],w52[4],w54[4]);
	ppu  p55(w43[5],w51[4],w52[4],w44[6],w53[5],w51[5],w52[5],w54[5]);
	ppu  p56(w43[6],w51[5],w52[5],w44[7],w53[6],w51[6],w52[6],w54[6]);
	SPPU p57(w43[7],w51[6],w52[6],w42[7],w53[7],w51[7],w52[7],w54[7]);
	
	assign result[5]  = w54[0];
	
	//ppu of row6
	ppu  p60(w53[0],d[6]  ,1'b0  ,w54[1],w63[0],w61[0],w62[0],w64[0]);
	ppu  p61(w53[1],w61[0],w62[0],w54[2],w63[1],w61[1],w62[1],w64[1]);
	ppu  p62(w53[2],w61[1],w62[1],w54[3],w63[2],w61[2],w62[2],w64[2]);
	ppu  p63(w53[3],w61[2],w62[2],w54[4],w63[3],w61[3],w62[3],w64[3]);
	ppu  p64(w53[4],w61[3],w62[3],w54[5],w63[4],w61[4],w62[4],w64[4]);
	ppu  p65(w53[5],w61[4],w62[4],w54[6],w63[5],w61[5],w62[5],w64[5]);
	ppu  p66(w53[6],w61[5],w62[5],w54[7],w63[6],w61[6],w62[6],w64[6]);
	SPPU p67(w53[7],w61[6],w62[6],w52[7],w63[7],w61[7],w62[7],w64[7]);
	
	assign result[6]  = w64[0];
	
	//ppu of row7
	SPPU p70(w63[0],d[7]  ,1'b0  ,w64[1],w73[0],w71[0],w72[0],w74[0]);
	SPPU p71(w63[1],w71[0],w72[0],w64[2],w73[1],w71[1],w72[1],w74[1]);
	SPPU p72(w63[2],w71[1],w72[1],w64[3],w73[2],w71[2],w72[2],w74[2]);
	SPPU p73(w63[3],w71[2],w72[2],w64[4],w73[3],w71[3],w72[3],w74[3]);
	SPPU p74(w63[4],w71[3],w72[3],w64[5],w73[4],w71[4],w72[4],w74[4]);
	SPPU p75(w63[5],w71[4],w72[4],w64[6],w73[5],w71[5],w72[5],w74[5]);
	SPPU p76(w63[6],w71[5],w72[5],w64[7],w73[6],w71[6],w72[6],w74[6]);
	ppu  p77(w63[7],w71[6],w72[6],w62[7],w73[7],w71[7],w72[7],w74[7]);
	
	half_adder hf0(1'b1,w72[7],result[15],);
	
	assign result[7]   = w74[0];
	assign result[8]   = w74[1];
	assign result[9]   = w74[2];
	assign result[10]  = w74[3];
	assign result[11]  = w74[4];
	assign result[12]  = w74[5];
	assign result[13]  = w74[6];
	assign result[14]  = w74[7];
	
endmodule
