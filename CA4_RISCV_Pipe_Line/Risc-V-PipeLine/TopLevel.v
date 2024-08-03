module TopLevel(Clk);

    input Clk;
    wire PCSrc, MemWrite, ALUSrc, RegWrite, branch, jump, sel, zero, jalr, stalF, stalD, flushD, flushE, PCSrcE, ResultSrcE0, RegWriteM, RegWriteW;
    wire[1:0] ResultSrc, forwardAE, forwardBE;
    wire[2:0] ImmSrc;
    wire[3:0] ALUControl;
    wire[6:0] op;
    wire[2:0] func3;
    wire[6:0] func7;
    wire[4:0] Rs1D, Rs2D, RdE, Rs2E, Rs1E, RdM, RdW; 

    DataPath dp(.CLK(Clk),.PCSrc(PCSrc),.branch(branch),.jalr(jalr), .jump(jump), .sel(sel), .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUControl(ALUControl), .ALUSrc(ALUSrc), .ImmSrc(ImmSrc), .RegWrite(RegWrite), .op(op), .func3(func3), .func7(func7), .zero(zero), .stallF(stalF), .StallD(stalD), .FlushD(flushD), .FlushE(flushE), .forwardAE(forwardAE), .forwardBE(forwardBE), .Rs1DD(Rs1D), .Rs2DD(Rs2D), .RdEE(RdE), .Rs2EE(Rs2E), .Rs1EE(Rs1E), .PCSrcE(PCSrcE), .RdMM(RdM), .RdWW(RdW), .RegWriteWW(RegWriteW), .RegWriteMM(RegWriteM), .ResultSrcE0E(ResultSrcE0));
    Controller ct(.op(op), .func3(func3), .func7(func7), .Zero(zero), .PCSrc(PCSrc), .branch(branch), .jump(jump),.jalr(jalr), .sel(sel), .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUControl(ALUControl), .ALUSrc(ALUSrc), .ImmSrc(ImmSrc), .RegWrite(RegWrite));
    HazzardUnit hu(.Rs1D(Rs1D), .Rs2D(Rs2D), .RdE(RdE), .Rs2E(Rs2E), .Rs1E(Rs1E), .PCSrcE(PCSrcE), .ResultSrcE0(ResultSrcE0), .RdM(RdM), .RegWriteM(RegWriteM), .RdW(RdW), .RegWriteW(RegWriteW), .stalF(stalF), .stalD(stalD), .flushD(flushD), .flushE(flushE), .ForwardAE(forwardAE), .ForwardBE(forwardBE));

endmodule