`timescale 1ns/1ns
module add1bit_TB();
	logic aa=0,bb=0,cci=0;
	wire ss,cco;
	add1bit CUT1(aa,bb,cci,ss,cco);
	initial begin
	#90 aa=1; 
	#90 bb=1;//worst case to0 s
	#90 cci=1;
	#90 aa=0;//worst case to1 co
	#90 bb=0; //worst case to0 co, to1 s
	#90 $stop;
	end
endmodule
