module RegDpM(ALURes, WriteDataE, RdE, ImmE, PC4E, ALUResM, WriteDataM, RdM, ImmM, PC4M, Clk);

    input[31:0] ALURes, WriteDataE, PC4E, ImmE;
    input[4:0] RdE;
    input Clk;
    output ALUResM, WriteDataM, RdM, PC4M, ImmM;
    reg[31:0] ALUResM, WriteDataM, PC4M, ImmM;
    reg[4:0] RdM;

    always@(posedge Clk) begin
        ALUResM <= ALURes;
        WriteDataM <= WriteDataE;
        RdM <= RdE;
        PC4M <= PC4E;
        ImmM <= ImmE;
    end

endmodule