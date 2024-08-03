module RegDpE(RD1, RD2, PCD, Rs1D, Rs2D, RdD, ExtImmD, PC4D, RD1E, RD2E, PCE, Rs1E, Rs2E, RdE, ExtImmE, PC4E, Clk, CLR);

    input[31:0] RD1, RD2, PCD, ExtImmD, PC4D;
    input[4:0] Rs1D, Rs2D, RdD;
    input Clk, CLR;
    output RD1E, RD2E, PCE, Rs1E, Rs2E, RdE, ExtImmE, PC4E;
    reg[31:0] RD1E, RD2E, PCE, ExtImmE, PC4E;
    reg[4:0] Rs1E, Rs2E, RdE;

    always@(posedge Clk)
        if(CLR)
            {RD1E, RD2E, PCE, Rs1E, Rs2E, RdE, ExtImmE, PC4E} = 0;
        else begin
            RD1E <= RD1;
            RD2E <= RD2;
            PCE <= PCD;
            Rs1E <= Rs1D;
            Rs2E <= Rs2D;
            RdE <= RdD;
            ExtImmE <= ExtImmD;
            PC4E <= PC4D;
        end

endmodule