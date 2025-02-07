module Reg5Bit(Din,ld,clk,rst,Dout);

	input clk,rst,ld;
	input [4:0]Din;
	output Dout;
	reg [4:0] Dout;

	always @(posedge clk)
	begin
		if(rst)
			Dout <= 5'b00000;
		else if (ld)
			Dout <= Din;
	end
endmodule
