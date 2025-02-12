module toplevel(start,clk,rst,run,fail,done,move);
	input start,clk,rst,run;
	output fail,done;
	output [1:0] move;

	wire cout,xory,emptys,emptyans,rev_move,Dout,rstdp,rstm,rstrev,pushs,pops,popans,pushans,din,WR,RD,ldx,ldy,selectxy,ldrev,backtrack,ldm,Din,donech,importdatas,importdataans,Doutans;
	
	DataPath DP(clk,rstdp,cout,xory,emptys,emptyans,rev_move,Dout,rstm,rstrev,pushs,pops,popans,pushans,din,WR,RD,ldx,ldy,selectxy,ldrev,backtrack,ldm,Din,donech,importdatas,importdataans,move);
	Controller CTR(start,run,clk,rst,cout,donech,xory,emptys,emptyans,rev_move,Din,rstdp,rstm,rstrev,pushs,importdatas,pops,din,WR,RD,ldx,ldy,selectxy,ldrev,backtrack,ldm,Dout,done,fail,pushans,importdataans, popans,rev_move);
endmodule