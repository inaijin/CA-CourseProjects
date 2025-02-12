module testb();
	
	reg [4:0] Xin,Yin;
     	reg clk,Din,RD,WR;
	wire Dout;	

	Maze m(Xin,Yin,clk,Din,RD,WR,Dout);


	always #5 clk = ~clk;
	initial begin 
		clk = 0;
		Xin = 5'd12;
		Yin = 5'd10;
		#10 RD = 1;
		#10 RD = 0;
		Xin = 5'd0;
		Yin = 5'd0;
		Din = 1'b1;
		#10 WR = 1;
		#10 WR = 0;
		#1000 $stop;
	end

    
endmodule
	
