module Adder(inp,sel,out);
	input [4:0] inp;
	input [1:0] sel;
	output out;
	reg [4:0] out;
	
	always @(*) begin
		case(sel)
			2'b00 : out = inp -1;
			2'b01 : out = inp + 1;
			2'b10 : out = inp - 1;
			2'b11 : out = inp + 1;
		endcase
	end
endmodule
