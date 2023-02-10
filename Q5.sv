`timescale 1ns/1ns
module onescount_TB();
	logic [0:126]aa=127'd0;
	wire[6:0]ww;
	onescount127bit CUT3(aa,ww);
	int k;
	initial begin
	#1000 aa=127'd67;
	#1000 aa=127'd124;
	#1000 aa=127'd45;
	#1000 aa=127'd1142;
	#1000 aa=127'd0;
	for (k=0;k<127;k=k+1) begin
	   #1000 aa[k]=1; 
	end
	#1000 $stop;
	end
endmodule
