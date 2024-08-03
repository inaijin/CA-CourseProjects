module donecheck(Xin,Yin,done);

	input [4:0] Xin,Yin;
	output done;
	reg done;
	always @(*) begin
		if(Xin == 15 && Yin == 15)
			done = 1'b1;
		else
			done = 1'b0;
	end
endmodule
