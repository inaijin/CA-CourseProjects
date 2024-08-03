module TopLevel(Clk);

    input Clk;
    wire PCSrc, MemWrite, RegWrite, branch, jump, sel, zero, jalr, AdrSrc, IrWrite;
    wire[1:0] ResultSrc, ALUSrcA, ALUSrcB;
    wire[2:0] ImmSrc;
    wire[3:0] ALUControl;
    wire[6:0] op;
    wire[2:0] func3;
    wire[6:0] func7;

    DataPath dp(.CLK(Clk),.PCSrc(PCSrc),.branch(branch),.jalr(jalr), .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUControl(ALUControl), .ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), .ImmSrc(ImmSrc), .RegWrite(RegWrite), .AdrSrc(AdrSrc), .IrWrite(IrWrite), .op(op), .func3(func3), .func7(func7), .zero(zero));
    Controller ct(.op(op), .func3(func3), .func7(func7), .Zero(zero), .PCSrc(PCSrc), .branch(branch), .jalr(jalr), .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUControl(ALUControl), .ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), .ImmSrc(ImmSrc), .RegWrite(RegWrite), .AdrSrc(AdrSrc), .IrWrite(IrWrite), .clk(Clk));

endmodule