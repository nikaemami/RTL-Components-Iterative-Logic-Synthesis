`timescale 1ns/1ns
module add1bit (input a,b,ci, output s,co);
	wire j,k,l;
	nand#(10,8) G1(j,a,b);
	xor#(17,19) G2(k,a,b);
	nand#(10,8) G3(l,k,ci);
	xor#(17,19) G4(s,k,ci);
	nand#(10,8) G5(co,j,l);
endmodule