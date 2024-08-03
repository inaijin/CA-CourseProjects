module TopLevel(Clk);

    input Clk;
    wire PCSrc, MemWrite, ALUSrc, RegWrite, branch, jump, sel, zero, jalr;
    wire[1:0] ResultSrc;
    wire[2:0] ImmSrc;
    wire[3:0] ALUControl;
    wire[6:0] op;
    wire[2:0] func3;
    wire[6:0] func7;

    DataPath dp(.CLK(Clk),.PCSrc(PCSrc),.branch(branch),.jalr(jalr), .jump(jump), .sel(sel), .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUControl(ALUControl), .ALUSrc(ALUSrc), .ImmSrc(ImmSrc), .RegWrite(RegWrite), .op(op), .func3(func3), .func7(func7), .zero(zero));
    Controller ct(.op(op), .func3(func3), .func7(func7), .Zero(zero), .PCSrc(PCSrc), .branch(branch), .jump(jump),.jalr(jalr), .sel(sel), .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUControl(ALUControl), .ALUSrc(ALUSrc), .ImmSrc(ImmSrc), .RegWrite(RegWrite));

endmodule