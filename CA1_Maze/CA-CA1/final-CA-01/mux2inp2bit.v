module mux_2_to_1_2bit(i0, i1, sel, y);
	input [1:0] i0, i1;
	input sel;
	output [1:0] y;
	assign y = sel ? i1 : i0;
endmodule
