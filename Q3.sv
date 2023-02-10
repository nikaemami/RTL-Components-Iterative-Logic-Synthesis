`timescale 1ns/1ns
module addnbit_TB();
	logic[3:0]aa=0,bb=0,cci=1;
	wire[3:0]ss,cco;
	addnbit #(.SIZE(4)) CUT2(aa,bb,cci,ss,cco);
	initial begin
	#300 bb=4'b1010;
	repeat(8)#300{aa}=$random;
	#300 cci=~cci;
	repeat(8)#180{bb}=$random;
	#300 $stop;
	end
endmodule