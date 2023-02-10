`timescale 1ns/1ns
module addnbit #(parameter SIZE) (a,b,ci,s,co);
	input[SIZE-1:0] a,b;
	input ci;
	output [SIZE-1:0]s;
	output co;
	wire [SIZE:0]carry;
	genvar k;
	assign carry[0]=ci;
	assign co=carry[SIZE];
	generate
             for (k=0 ; k<SIZE ; k=k+1) begin : full_adders
	     assign #(SIZE*38) {co,s}={a+b+ci};
	     end
	endgenerate
endmodule
