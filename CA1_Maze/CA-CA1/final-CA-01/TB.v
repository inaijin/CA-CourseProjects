module testBench();
	
	reg start,clk,rst,run;
	wire fail,done;
	wire [1:0] move;
	
	toplevel test(start,clk,rst,run,fail,done,move);

	always #5 clk = ~clk;
	initial begin 
		clk = 0;
		rst = 0;
		start = 0;
		run = 0;
		#10 rst = 1;
		#10 rst = 0;
		#10 start = 1;
		#10 start = 0;
		#27000
		#10 run = 1;
		#10 run = 0;
		#1000000 $stop;
	end

    
endmodule
	
