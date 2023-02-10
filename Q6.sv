`timescale 1ns/1ns
module ones_counter_127 (input [126:0]a, output logic [6:0]w);
int k;
	always @(a) begin
	     w=7'd0;
		for (k=0;k<=126;k=k+1) begin
		   if (a[k]==1'b1) w=w+1;
		end
	end
endmodule