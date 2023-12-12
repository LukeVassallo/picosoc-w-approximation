module SCDM8_95(c,d,resultX);

	input  [7:0] c;
	input  [7:0] d;
	output [15:0] resultX;
	
	wire [11:0] rA; 
	wire [11:0] rB;
	
	S_GroupAX_9 gA(c,d[3:0],rA);
	S_GroupBX_5 gB(c,d[7:4],rB);
	
	assign resultX[3:0] = rA[3:0];
	
	CLA cla0({4'b0000,rA[11:4]},rB[11:0],resultX[15:4]);


endmodule

module S_GroupAX_9(c,d,resultX);

	input  [7:0]  c;
	input  [3:0]  d;
	output [11:0] resultX;
	
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
	
	//row0
	 and(w0[0],c[0],d[0]);
	 and(w0[1],c[1],d[0]);
	 and(w0[2],c[2],d[0]);
	 and(w0[3],c[3],d[0]);
	 and(w0[4],c[4],d[0]);
	 and(w0[5],c[5],d[0]);
	 and(w0[6],c[6],d[0]);
	nand(w0[7],c[7],d[0]);
	
	assign resultX[0] = w0[0];
	
	
	CDPPU  CD10(c[0],d[1]  ,w0[1],w13[0],w11[0],resultX[1]);
	CDPPU  CD11(c[1],w11[0],w0[2],w13[1],w11[1],w14[1]);
	CDPPU  CD12(c[2],w11[1],w0[3],w13[2],w11[2],w14[2]);
	CDPPU  CD13(c[3],w11[2],w0[4],w13[3],w11[3],w14[3]);
	CDPPU  CD14(c[4],w11[3],w0[5],w13[4],w11[4],w14[4]);
	CDPPU  CD15(c[5],w11[4],w0[6],w13[5],w11[5],w14[5]);
	CDPPU  CD16(c[6],w11[5],w0[7],w13[6],w11[6],w14[6]);
	SCDPPU CD17(c[7],w11[6],1'b1 ,w13[7],w11[7],w14[7]);

	
	
	CDPPU  CD20(w13[0],d[2]  ,w14[1],w23[0],w21[0],resultX[2]);
	CDPPU  CD21(w13[1],w21[0],w14[2],w23[1],w21[1],w24[1]);
	CDPPU  CD22(w13[2],w21[1],w14[3],w23[2],w21[2],w24[2]);
	CDPPU  CD23(w13[3],w21[2],w14[4],w23[3],w21[3],w24[3]);
	CDPPU  CD24(w13[4],w21[3],w14[5],w23[4],w21[4],w24[4]);
	CDPPU  CD25(w13[5],w21[4],w14[6],w23[5],w21[5],w24[5]);
	CDPPU  CD26(w13[6],w21[5],w14[7],w23[6],w21[6],w24[6]);
	SCDPPU CD27(w13[7],w21[6],1'b0  ,w23[7],w21[7],w24[7]);
	

	
	CDPPU  CD30(w23[0],d[3]  ,w24[1],w33[0],w31[0],resultX[3]);
	CDPPU  CD31(w23[1],w31[0],w24[2],w33[1],w31[1],resultX[4]);
	CDPPU  CD32(w23[2],w31[1],w24[3],w33[2],w31[2],resultX[5]);
	CDPPU  CD33(w23[3],w31[2],w24[4],w33[3],w31[3],resultX[6]);
	CDPPU  CD34(w23[4],w31[3],w24[5],w33[4],w31[4],resultX[7]);
	CDPPU  CD35(w23[5],w31[4],w24[6],w33[5],w31[5],resultX[8]);
	
	PPUH   ph36(w23[6],w31[5],w24[7],w33[6],w31[6],w32[6],w34[6]);
	SPPUH  ph37(w23[7],w31[6],w32[6],w33[7],w31[7],w32[7],w34[7]);
	

	
	assign resultX[9]  = w34[6];
	assign resultX[10] = w34[7];
	assign resultX[11] = w32[7];


endmodule

module S_GroupBX_5(c,d,resultX);

	input  [7:0]  c;
	input  [3:0]  d;
	output [11:0] resultX;
	
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
	
	//row0
	 and(w0[0],c[0],d[0]);
	 and(w0[1],c[1],d[0]);
	 and(w0[2],c[2],d[0]);
	 and(w0[3],c[3],d[0]);
	 and(w0[4],c[4],d[0]);
	 and(w0[5],c[5],d[0]);
	 and(w0[6],c[6],d[0]);
	nand(w0[7],c[7],d[0]);
	
	assign resultX[0] = w0[0];
	
	
	CDPPU  CD10(c[0],d[1]  ,w0[1],w13[0],w11[0],resultX[1]);
	CDPPU  CD11(c[1],w11[0],w0[2],w13[1],w11[1],w14[1]);
	CDPPU  CD12(c[2],w11[1],w0[3],w13[2],w11[2],w14[2]);
	CDPPU  CD13(c[3],w11[2],w0[4],w13[3],w11[3],w14[3]);

	PPUH   ph15(c[5],w11[4],w0[6],w13[5],w11[5],w12[5],w14[5]);
	
	CDPPU  CD20(w13[0],d[2]  ,w14[1],w23[0],w21[0],resultX[2]);
	CDPPU  CD21(w13[1],w21[0],w14[2],w23[1],w21[1],w24[1]);
	CDPPU  CD22(w13[2],w21[1],w14[3],w23[2],w21[2],w24[2]);
	
	PPUF   pf(c[4],w11[3],w13[3],w21[2],w0[5],w13[4],w11[4],w23[3],w21[3],w22[3],w24[3]);
	
	SCDPPU CD30(w23[0],d[3]  ,w24[1],w33[0],w31[0],resultX[3]);
	SCDPPU CD31(w23[1],w31[0],w24[2],w33[1],w31[1],resultX[4]);
	
	SPPUH  ph32(w23[2],w31[1],w24[3],w33[2],w31[2],w32[2],resultX[5]);
	
	
	ppu    p16(c[6],w11[5],w12[5],w0[7],w13[6],w11[6],w12[6],w14[6]);
	SPPU   p17(c[7],w11[6],w12[6],1'b0 ,w13[7],w11[7],w12[7],w14[7]);
	
	
	ppu    p24(w13[4],w21[3],w22[3],w14[5],w23[4],w21[4],w22[4],w24[4]);
	ppu    p25(w13[5],w21[4],w22[4],w14[6],w23[5],w21[5],w22[5],w24[5]);
	ppu    p26(w13[6],w21[5],w22[5],w14[7],w23[6],w21[6],w22[6],w24[6]);
	SPPU   p27(w13[7],w21[6],w22[6],w12[7],w23[7],w21[7],w22[7],w24[7]);
	
	
	SPPU   p33(w23[3],w31[2],w32[2],w24[4],w33[3],w31[3],w32[3],w34[3]);
	SPPU   p34(w23[4],w31[3],w32[3],w24[5],w33[4],w31[4],w32[4],w34[4]);
	SPPU   p35(w23[5],w31[4],w32[4],w24[6],w33[5],w31[5],w32[5],w34[5]);
	SPPU   p36(w23[6],w31[5],w32[5],w24[7],w33[6],w31[6],w32[6],w34[6]);
	ppu    p37(w23[7],w31[6],w32[6],w22[7],w33[7],w31[7],w32[7],w34[7]);
	
	half_adder hf0(1'b1,w32[7],resultX[11],);
	
	
	assign resultX[6]  = w34[3];
	assign resultX[7]  = w34[4];
	assign resultX[8]  = w34[5];
	assign resultX[9]  = w34[6];
	assign resultX[10] = w34[7];


endmodule
