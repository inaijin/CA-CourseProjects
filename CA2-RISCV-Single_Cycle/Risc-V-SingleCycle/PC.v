module PC(PCIn, PCOut, Clk);

    input[31:0] PCIn;
    input Clk;
    output PCOut;
    reg[31:0] PCOut = 32'b0;

    always@(posedge Clk)
        PCOut <= PCIn;

endmodule