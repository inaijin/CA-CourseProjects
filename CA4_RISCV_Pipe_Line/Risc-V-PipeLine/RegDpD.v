module RegDpD(inst, pc, pc4, instrD, PCD, PC4D, Clk, EN, CLR);

    input[31:0] inst, pc, pc4;
    input Clk, EN, CLR;
    output instrD, PCD, PC4D;
    reg[31:0] instrD, PCD, PC4D;

    always @(posedge Clk) begin
        if(CLR)
            {instrD,PCD,PC4D} = 0;
        else if(EN == 0) begin
            instrD <= inst;
            PCD <= pc;
            PC4D <= pc4;
        end
    end

endmodule