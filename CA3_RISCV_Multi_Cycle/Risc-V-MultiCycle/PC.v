module PC(PCIn, PCOut, EN, Clk);

    input[31:0] PCIn;
    input Clk, EN;
    output PCOut;
    reg[31:0] PCOut = 32'b0;

    always@(posedge Clk)
        if(EN)
            PCOut <= PCIn;

endmodule