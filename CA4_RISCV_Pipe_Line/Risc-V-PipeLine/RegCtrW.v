module RegCtrW(RegWriteM, ResSrcM, JalrM, selM, RegWriteW, ResSrcW, JalrW, selW, Clk);

    input RegWriteM, Clk, JalrM, selM;
    input[1:0] ResSrcM;
    output RegWriteW, ResSrcW, JalrW, selW;
    reg RegWriteW = 0 , JalrW = 0, selW = 0;
    reg[1:0] ResSrcW = 0;

    always@(posedge Clk) begin
        RegWriteW <= RegWriteM;
        ResSrcW <= ResSrcM;
        JalrW <= JalrM;
    end

endmodule