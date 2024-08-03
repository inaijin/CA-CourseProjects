module RegisterFile(A1, A2, A3, WD3, RD1, RD2, WE3, Clk);

    input[19:15] A1;
    input[24:20] A2;
    input[11:7] A3;
    input[31:0] WD3;
    input WE3, Clk;
    output RD1, RD2;
    reg[31:0] RD1, RD2;

    reg[31:0] registers[0:31];

    initial begin
        registers[0] = 32'b0;
        registers[1] = 32'b0;
        registers[2] = 32'b0;
        registers[3] = 32'b0;
        registers[4] = 32'b0;
        registers[5] = 32'b0;
        registers[6] = 32'b0;
        registers[7] = 32'b0;
    end

    always@(posedge ~Clk)
        if(WE3)
            registers[A3] <= WD3;

    always@(A1, A2, A3, WD3, Clk, WE3, registers)
    begin
        RD1 <= registers[A1];
        RD2 <= registers[A2];
    end

endmodule