module mux_4_to_1_1bit (i0, i1,i2,i3, sel, y);
	input i0, i1,i2,i3;
	input [1:0]sel;
	output y;
	reg y ;
	always @(i0,i1,i2,i3,sel)begin
		case(sel)
			2'b00 : y = i0;
			2'b01 : y = i1;
			2'b10 : y = i2;
			2'b11 : y = i3;
		endcase
	end
endmodule
