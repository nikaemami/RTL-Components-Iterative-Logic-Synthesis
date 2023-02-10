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
module onescount127bit (input [0:126]a, output[6:0]count);
	wire [11:0]carry6;
	wire [19:0]carry5;
	wire [31:0]carry4;
	wire [47:0]carry3;
	wire [63:0]carry2;
	
	genvar i;
	generate
             for (i=0 ; i<32 ; i=i+1) begin : adder1bit
	     add1bit adder1(a[3*i],a[3*i+1],a[3*i+2],carry2[63-2*i-1],carry2[63-2*i]);
	     end
	endgenerate

	genvar j;
	generate
             for (j=0 ; j<16 ; j=j+1) begin : adder2bit
	     addnbit #(.SIZE(2)) adder2(carry2[63-(2*j):63-(2*(j+1)-1)],carry2[63-(2*(j+1)):63-(2*(j+2)-1)],
			a[96+j],carry3[46-(3*j):46-(3*(j+1)-2)],carry3[47-3*j]);
	     end
	endgenerate

	genvar k;
	generate
             for (k=0 ; k<8 ; k=k+1) begin : adder3bit
	     addnbit #(.SIZE(3)) adder3(carry3[47-(3*k):47-(3*(k+1)-1)],carry3[47-(3*(k+1)):47-(3*(k+2)-1)],
			a[112+k],carry4[30-(4*k):30-(4*(k+1)-2)],carry4[31-4*k]);
	     end
	endgenerate

	genvar n;
	generate
             for (n=0 ; n<4 ; n=n+1) begin : adder4bit
	     addnbit #(.SIZE(4)) adder4(carry4[31-(4*n):31-(4*(n+1)-1)],carry4[31-(4*(n+1)):31-(4*(n+2)-1)],
			a[120+n],carry5[18-(5*n):18-(5*(n+1)-2)],carry5[19-5*n]);
	     end
	endgenerate

	genvar m;
	generate
             for (m=0 ; m<2 ; m=m+1) begin : adder5bits
	     addnbit #(.SIZE(5)) adder5(carry5[19-(5*m):19-(5*(m+1)-1)],carry5[19-(5*(m+1)):19-(5*(m+2)-1)],
			a[124+m],carry6[10-(6*m):10-(6*(m+1)-2)],carry6[11-6*m]);
	     end
	endgenerate

	addnbit #(.SIZE(6)) adder6(carry6[11:6],carry6[5:0],a[126],count[5:0],count[6]);
endmodule
