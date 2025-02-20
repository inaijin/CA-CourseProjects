module stack(push,pop,clk,Din,importdata,Dout,empty);
	input push,pop,clk,importdata;
	input [1:0] Din;
	output Dout,empty;
	reg [1:0] Dout;

	reg empty;
	reg [1:0] stack_mem [0:256];
	reg [7:0] ptr = 8'd0;

	always @(posedge clk) begin
		if(pop)
			begin
				if(ptr != 8'd0)
					ptr <= ptr -1;
			end
		if(push)
			begin
				ptr <= ptr + 1;
			end
		if(importdata)
			begin
				stack_mem[ptr] <= Din ;
			end
	end
	always @(ptr) begin
		if(ptr == 8'd0)
			empty <= 1'b1;
		else
			empty <= 1'b0;
	end

	assign Dout = stack_mem[ptr];
	
endmodule
