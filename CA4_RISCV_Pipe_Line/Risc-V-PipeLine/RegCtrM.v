module RegCtrM(RegWriteE, ResSrcE, MemWriteE, JalrE, selE, RegWriteM, ResSrcM, MemWriteM, JalrM, selM, Clk);

    input RegWriteE, MemWriteE, JalrE, Clk, selE;
    input[1:0] ResSrcE;
    output RegWriteM, ResSrcM, MemWriteM, JalrM, selM;
    reg RegWriteM = 0, MemWriteM = 0, JalrM = 0, selM = 0;
    reg[1:0] ResSrcM = 0;

    always@(posedge Clk) begin
        RegWriteM <= RegWriteE;
        ResSrcM <= ResSrcE;
        MemWriteM <= MemWriteE;
        JalrM <= JalrE;
    end

endmodule