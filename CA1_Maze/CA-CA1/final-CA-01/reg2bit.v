module Reg2Bit(Din,clk,ld,rst,Dout);

	input clk,rst,ld;
	input[1:0] Din;
	output Dout;
	reg [1:0] Dout;

	always @(posedge clk)
	begin
		if(rst)
			Dout <= 2'b00;
		else if(ld)
			Dout <= Din;
	end
endmodule
