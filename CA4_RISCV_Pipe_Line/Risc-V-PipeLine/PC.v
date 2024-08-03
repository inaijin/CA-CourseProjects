module PC(PCIn, PCOut, Clk, EN);

    input[31:0] PCIn;
    input Clk, EN;
    output PCOut;
    reg[31:0] PCOut = 32'b0;

    always@(posedge Clk)
        if(EN == 0)
            PCOut <= PCIn;

endmodule