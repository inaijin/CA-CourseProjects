module DataPath(clk,rst,cout,xory,emptys,emptyans,rev_move,Dout,rstm,rstrev,pushs,pops,popans,pushans,din,WR,RD,ldx,ldy,selectxy,ldrev,backtrack,ldm,Din,donech,importdatas,importdataans,Doutans);
	output cout,xory,emptys,emptyans,rev_move,Dout,donech,Doutans;
	input clk,rst,rstm,rstrev,pushs,pops,pushans,popans,din,WR,RD,ldx,ldy,selectxy,ldrev,backtrack,ldm,Din,importdatas,importdataans;
	
	wire [4:0] yout,xout,addinp,addout;
	wire [1:0] outm , inpm , outcount , revm , compmove , addsel,Dins,Douts,Dinans,Doutans;

	Reg2Bit regmove(inpm,clk,ldm,rstm,outm);
	mux_2_to_1_2bit backmux(outcount, Douts ,backtrack,inpm);
	inc Inc(outm,outcount,cout);
	mux_4_to_1 revmux(2'd3, 2'd2,2'd1,2'd0, outm, revm);
	mux_2_to_1_2bit compmux(outm, revm, rev_move, compmove);
	reg_1b revreg(1'b1, ldrev, rstrev,clk, rev_move);
	mux_4_to_1_1bit xory_mux(1'b0, 1'b1,1'b1,1'b0, compmove, xory);
	Reg5Bit regx(addout,ldx,clk,rst,xout);
	Reg5Bit regy(addout,ldy,clk,rst,yout);
	mux_2_to_1_5bit addinp_mux(yout,xout,selectxy,addinp);
	donecheck DoneCheck(xout,yout,donech);
	Adder ADD(addinp,compmove,addout);
	Maze maze(xout,yout,clk,Din,RD,WR,Dout);
	stack s(pushs,pops,clk,outm,importdatas,Douts,emptys);
	stack ans(pushans,popans,clk,Douts,importdataans,Doutans,emptyans);

	

endmodule
