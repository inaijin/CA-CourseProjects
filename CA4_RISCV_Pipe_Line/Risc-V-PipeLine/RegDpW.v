module RegDpW(ALUResM, ReadData, RdM, ImmM, PC4M, ALUResW, ReadDataW, RdW, ImmW, PC4W, Clk);

    input[31:0] ALUResM, ReadData, PC4M, ImmM;
    input[4:0] RdM;
    input Clk;
    output ALUResW, ReadDataW, RdW, PC4W, ImmW;
    reg[31:0] ALUResW, ReadDataW, PC4W, ImmW;
    reg[4:0] RdW;

    always@(posedge Clk) begin
        ALUResW <= ALUResM;
        ReadDataW <= ReadData;
        RdW <= RdM;
        PC4W <= PC4M;        
        ImmW <= ImmM;
    end

endmodule