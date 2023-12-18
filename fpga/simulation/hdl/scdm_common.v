module SCDPPU(ai,bi,Sin,ao,bo,Sout);

	input  ai,bi,Sin;
	output ao,bo,Sout;
	
	wire m;
	
	assign ao = ai;
	assign bo = bi;
	nand(m,ai,bi);
	xor(Sout,Sin,m);


endmodule

module SPPUH(ai,bi,Sin,ao,bo,Cout,Sout);

	input  ai,bi,Sin;
	output ao,bo,Cout,Sout;
	
	wire m;
	
	assign ao = ai;
	assign bo = bi;
	nand(m,ai,bi);
	half_adder h0(Sin,m,Sout,Cout);


endmodule

module PPUF(ai,bi,aj,bj,Sin,ao,bo,ajo,bjo,Cout,Sout);

	input  ai,bi,aj,bj,Sin;
	output ao,bo,ajo,bjo,Cout,Sout;
	
	wire m1,m2;
	
	assign ao = ai;
	assign bo = bi;
	assign ajo = aj;
	assign bjo = bj;
	and(m1,ai,bi);
	and(m2,aj,bj);
	full_adder h0(Sin,m1,m2,Sout,Cout);
	
endmodule

module CDPPU(ai,bi,Sin,ao,bo,Sout);

	input  ai,bi,Sin;
	output ao,bo,Sout;
	
	wire m;
	
	assign ao = ai;
	assign bo = bi;
	and(m,ai,bi);
	xor(Sout,Sin,m);
	
endmodule

module PPUH(ai,bi,Sin,ao,bo,Cout,Sout);

	input  ai,bi,Sin;
	output ao,bo,Cout,Sout;
	
	wire m;
	
	assign ao = ai;
	assign bo = bi;
	and(m,ai,bi);
	half_adder h0(Sin,m,Sout,Cout);
	
endmodule

module SPPU(Ci,Di,Cin,Sin,Co,Do,Cout,Sout);

	input Ci,Di,Sin,Cin;
	output Co,Do,Cout,Sout;
	
	wire m;
	
	assign Do = Di;
	assign Co = Ci;
	nand(m,Ci,Di);
	full_adder f0(m,Sin,Cin,Sout,Cout);


endmodule

module full_adder(a,b,Cin,sum,Cout);

	input a,b,Cin;
	output sum,Cout;
	
	wire w1,w2,w3;
	
	xor(w1,a,b);
	xor(sum,w1,Cin);
	and(w2,a,b);
	and(w3,w1,Cin);
	or(Cout,w3,w2);
	
endmodule


module half_adder(a,b,sum,Cout);

	input  a,b;
	output sum,Cout;
	
	xor(sum,a,b);
	and(Cout,a,b);


endmodule


module ppu(Ci,Di,Cin,Sin,Co,Do,Cout,Sout);

	input Ci,Di,Sin,Cin;
	output Co,Do,Cout,Sout;
	
	wire m;
	
	assign Do = Di;
	assign Co = Ci;
	and(m,Ci,Di);
	full_adder f0(m,Sin,Cin,Sout,Cout);
	
endmodule

module CLA(a,b,result);

	input  [11:0] a ;
	input  [11:0] b ;
	output [11:0] result ;
	
	wire [11:0] p;
	wire [11:0] g;
	wire [11:1] c;
	
	xor(p[0],a[0],b[0]);
	and(g[0],a[0],b[0]);
	
	xor(p[1],a[1],b[1]);
	and(g[1],a[1],b[1]);
	
	xor(p[2],a[2],b[2]);
	and(g[2],a[2],b[2]);
	
	xor(p[3],a[3],b[3]);
	and(g[3],a[3],b[3]);
	
	xor(p[4],a[4],b[4]);
	and(g[4],a[4],b[4]);
	
	xor(p[5],a[5],b[5]);
	and(g[5],a[5],b[5]);
	
	xor(p[6],a[6],b[6]);
	and(g[6],a[6],b[6]);
	
	xor(p[7],a[7],b[7]);
	and(g[7],a[7],b[7]);
	
	xor(p[8],a[8],b[8]);
	and(g[8],a[8],b[8]);
	
	xor(p[9],a[9],b[9]);
	and(g[9],a[9],b[9]);
	
	xor(p[10],a[10],b[10]);
	and(g[10],a[10],b[10]);
	
	xor(p[11],a[11],b[11]);
	and(g[11],a[11],b[11]);
	
	assign c[1]  = g[0] ;
	assign c[2]  = g[1]  || (p[1]  && g[0]) ;
	assign c[3]  = g[2]  || (p[2]  && g[1])  || (p[1] && p[2]  && g[0]);
	assign c[4]  = g[3]  || (p[3]  && g[2])  || (p[2] && p[3]  && g[1]) || (p[1] && p[2] && p[3]  && g[0]);
	assign c[5]  = g[4]  || (p[4]  && g[3])  || (p[3] && p[4]  && g[2]) || (p[2] && p[3] && p[4]  && g[1]) || (p[1] && p[2] && p[3] && p[4]  && g[0]);
	assign c[6]  = g[5]  || (p[5]  && g[4])  || (p[4] && p[5]  && g[3]) || (p[3] && p[4] && p[5]  && g[2]) || (p[2] && p[3] && p[4] && p[5]  && g[1]) || (p[1] && p[2] && p[3] && p[4] && p[5]  && g[0]);
	assign c[7]  = g[6]  || (p[6]  && g[5])  || (p[5] && p[6]  && g[4]) || (p[4] && p[5] && p[6]  && g[3]) || (p[3] && p[4] && p[5] && p[6]  && g[2]) || (p[2] && p[3] && p[4] && p[5] && p[6]  && g[1]) || (p[1] && p[2] && p[3] && p[4] && p[5] && p[6]  && g[0]);
	assign c[8]  = g[7]  || (p[7]  && g[6])  || (p[6] && p[7]  && g[5]) || (p[5] && p[6] && p[7]  && g[4]) || (p[4] && p[5] && p[6] && p[7]  && g[3]) || (p[3] && p[4] && p[5] && p[6] && p[7]  && g[2]) || (p[2] && p[3] && p[4] && p[5] && p[6] && p[7]  && g[1]) || (p[1] && p[2] && p[3] && p[4] && p[5] && p[6] && p[7]  && g[0]);	
	assign c[9]  = g[8]  || (p[8]  && g[7])  || (p[7] && p[8]  && g[6]) || (p[6] && p[7] && p[8]  && g[5]) || (p[5] && p[6] && p[7] && p[8]  && g[4]) || (p[4] && p[5] && p[6] && p[7] && p[8]  && g[3]) || (p[3] && p[4] && p[5] && p[6] && p[7] && p[8]  && g[2]) || (p[2] && p[3] && p[4] && p[5] && p[6] && p[7] && p[8]  && g[1]) || (p[1] && p[2] && p[3] && p[4] && p[5] && p[6] && p[7] && p[8]  && g[0]);
	assign c[10] = g[9]  || (p[9]  && g[8])  || (p[8] && p[9]  && g[7]) || (p[7] && p[8] && p[9]  && g[6]) || (p[6] && p[7] && p[8] && p[9]  && g[5]) || (p[5] && p[6] && p[7] && p[8] && p[9]  && g[4]) || (p[4] && p[5] && p[6] && p[7] && p[8] && p[9]  && g[3]) || (p[3] && p[4] && p[5] && p[6] && p[7] && p[8] && p[9]  && g[2]) || (p[2] && p[3] && p[4] && p[5] && p[6] && p[7] && p[8] && p[9]  && g[1]) || (p[1] && p[2] && p[3] && p[4] && p[5] && p[6] && p[7] && p[8] && p[9]  && g[0]);	
	assign c[11] = g[10] || (p[10] && g[9])  || (p[9] && p[10] && g[8]) || (p[8] && p[9] && p[10] && g[7]) || (p[7] && p[8] && p[9] && p[10] && g[6]) || (p[6] && p[7] && p[8] && p[9] && p[10] && g[5]) || (p[5] && p[6] && p[7] && p[8] && p[9] && p[10] && g[4]) || (p[4] && p[5] && p[6] && p[7] && p[8] && p[9] && p[10] && g[3]) || (p[3] && p[4] && p[5] && p[6] && p[7] && p[8] && p[9] && p[10] && g[2]) || (p[2] && p[3] && p[4] && p[5] && p[6] && p[7] && p[8] && p[9] && p[10] && g[1]) || (p[1] && p[2] && p[3] && p[4] && p[5] && p[6] && p[7] && p[8] && p[9] && p[10] && g[0]);	

	assign result[0] = p[0];
	xor(result[1],p[1],c[1]);
	xor(result[2],p[2],c[2]);
	xor(result[3],p[3],c[3]);
	xor(result[4],p[4],c[4]);
	xor(result[5],p[5],c[5]);
	xor(result[6],p[6],c[6]);
	xor(result[7],p[7],c[7]);
	xor(result[8],p[8],c[8]);
	xor(result[9],p[9],c[9]);
	xor(result[10],p[10],c[10]);
	xor(result[11],p[11],c[11]);
		
endmodule