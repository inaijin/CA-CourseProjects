module inc(inp,out,cout);
	input [1:0] inp;
	output [1:0] out;
	output cout;

	assign {cout,out} = inp + 1;
endmodule
