module RegMemResRead(ReadData, Data, Clk);

    input[31:0] ReadData;
    input Clk;
    output Data;
    reg[31:0] Data;

    always@(posedge Clk)
        Data <= ReadData;

endmodule