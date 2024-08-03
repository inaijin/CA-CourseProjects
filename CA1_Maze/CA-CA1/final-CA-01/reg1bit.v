module reg_1b(d, ld, rst,clk, q);
	input d,rst;
	input ld, clk;
	output q;
	reg q;
always @(posedge clk) begin
	if(rst)
			q <= 1'b0;
	else if (ld)
			q <= d;
	end
endmodule
