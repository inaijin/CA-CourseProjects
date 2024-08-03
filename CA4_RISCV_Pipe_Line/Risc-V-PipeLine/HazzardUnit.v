module HazzardUnit(Rs1D, Rs2D, RdE, Rs2E, Rs1E, PCSrcE, ResultSrcE0, RdM, RegWriteM, RdW, RegWriteW, stalF, stalD, flushD, flushE, ForwardAE, ForwardBE);
    
    input[4:0] Rs1D, Rs2D, RdE, Rs1E, Rs2E, RdM, RdW;
    input PCSrcE, ResultSrcE0, RegWriteM, RegWriteW;
    output stalF, stalD, flushD, flushE, ForwardAE, ForwardBE;
    reg stalF, stalD, flushD, flushE;
    reg[1:0] ForwardAE, ForwardBE;

    reg lwStall = 0;

    always@*begin
        if((Rs1E == RdM) & RegWriteM & Rs1E != 0)
            ForwardAE = 2'b10;
        else if((Rs1E == RdW) & RegWriteW & Rs1E != 0)
            ForwardAE = 2'b01;
        else
            ForwardAE = 2'b00;
        
        if((Rs2E == RdM) & RegWriteM & Rs2E != 0)
            ForwardBE = 2'b10;
        else if((Rs2E == RdW) & RegWriteW & Rs2E != 0)
            ForwardBE = 2'b01;
        else
            ForwardBE = 2'b00;
    end

    always@*begin
        if ((((Rs1D == RdE) || (Rs2D == RdE)) && ResultSrcE0) != 1'bx)
            assign lwStall = (((Rs1D == RdE) || (Rs2D == RdE)) && ResultSrcE0);
        else if (((Rs1D == RdE) || (Rs2D == RdE)) && ResultSrcE0)
            assign lwStall = 1'b1;
        else
            assign lwStall = 1'b0;
    end


    assign stalF = lwStall;
    assign stalD = lwStall;
    
    assign flushD = PCSrcE;
    assign flushE = lwStall | PCSrcE;

endmodule