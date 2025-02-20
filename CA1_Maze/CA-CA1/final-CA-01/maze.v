
module Maze(Xin,Yin,clk,Din,RD,WR,Dout);

	input [4:0] Xin,Yin ;
	input Din,RD,WR,clk;
	output Dout;
	reg Dout;
	reg i;
	reg [15:0] map [0:15];
	reg [15:0] temprd;
	initial begin
	$readmemh ("map0.txt", map);
	end
	always @(posedge clk , posedge RD)
	begin
		if(RD)
			begin
			if(Xin[4] || Yin[4])
				Dout <= 1'b1;
			else 
				Dout <= map[Yin][5'd15 - Xin];
			end
		if(WR)
			begin
			map[Yin][5'd15 - Xin] <= Din;
			end
	end	

endmodule


module Tbmaze();
	reg [4:0]Xin,Yin;
	reg clk,Din,RD,WR;
	wire Dout;
	Maze tmaze(Xin,Yin,clk,Din,RD,WR,Dout);
	always #10 clk = ~clk ;
	initial begin
	clk = 0;
	Xin = 5'd10;
	Yin = 5'd2;
	#5 RD = 1;
	#5 RD = 0;
Xin = 5'd10;
	Yin = 5'd3;
	#5 RD = 1;
	#5 RD = 0;
Xin = 5'd10;
	Yin = 5'd4;
	#5 RD = 1;
	#5 RD = 0;
Yin = 5'd5;
	#5 RD = 1;
	#5 RD = 0;
Yin = 5'd6;
	#5 RD = 1;
	#5 RD = 0;
Yin = 5'd7;
	#5 RD = 1;
	#5 RD = 0;
Yin = 5'd8;
	#5 RD = 1;
	#5 RD = 0;
	#1000 $stop;
	end
	
	

endmodule