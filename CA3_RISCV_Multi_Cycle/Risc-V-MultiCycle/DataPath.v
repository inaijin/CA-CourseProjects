module DataPath(CLK, PCSrc, branch, jalr, ResultSrc, MemWrite, ALUControl, ALUSrcA, ALUSrcB, ImmSrc, RegWrite, AdrSrc, IrWrite, op, func3, func7, zero);

    input CLK,PCSrc, MemWrite, RegWrite, branch, jalr, AdrSrc, IrWrite;
    input[1:0] ResultSrc, ALUSrcA, ALUSrcB;
    input[2:0] ImmSrc;
    input[3:0] ALUControl;
    output zero, op, func3, func7;
    reg zero;
    reg[6:0] op;
    reg[2:0] func3;
    reg[6:0] func7;

    wire [31:0] Adr, instr, ReadDataIM, Result, oldPC, instruction, DataMem, rd1Out, rd2Out, immExOut, A, B, SrcA, SrcB, ALUresult, ALUOut, pcOut ;
    wire Z;

    assign op = instruction[6:0];
    assign func3 = instruction[14:12];
    assign func7 = instruction[31:25];
    assign zero = Z;
    assign pcsrc = PCSrc | (branch & zero);

    PC pc(.PCIn(Result), .PCOut(pcOut), .Clk(CLK), .EN(pcsrc));

    Mux1Bit IMMux(.sel1(pcOut), .sel2(Result), .sel(AdrSrc), .res(Adr));
   
    InstMem IM(.dataIn(Adr), .WD(B), .WE(MemWrite), .Clk(CLk), .readData(ReadDataIM), .dataOut(instr));
    
    RegInstPC RIP(.pc(pcOut), .inst(instr), .en(IrWrite), .clk(CLK), .oldPC(oldPC), .instr(instruction));

    RegMemResRead RMRR(.ReadData(ReadDataIM), .Data(DataMem), .Clk(CLK));

    RegisterFile rf(.A1(instruction[19:15]), .A2(instruction[24:20]), .A3(instruction[11:7]), .WD3(Result), .RD1(rd1Out), .RD2(rd2Out), .WE3(RegWrite), .Clk(CLK));

    ImmExtender immex(.Imm(instruction[31:7]), .ImmSrc(ImmSrc), .ImmExt(immExOut));

    RegRF RRF(.RD1(rd1Out), .RD2(rd2Out), .A(A), .B(B), .Clk(CLK));

    Mux2Bit MuxAluSrcA(.sel1(pcOut), .sel2(oldPC), .sel3(A), .sel4(32'bz), .ResultSrc(ALUSrcA), .Result(SrcA));

    Mux2Bit MuxAluSrcB(.sel1(B), .sel2(immExOut), .sel3(32'd4), .sel4(32'bz), .ResultSrc(ALUSrcB), .Result(SrcB));

    ALU alu(.SrcA(SrcA), .SrcB(SrcB), .ALUControl(ALUControl), .ALUResult(ALUresult), .Zero(Z));

    RegMemResRead ALUOOut(.ReadData(ALUresult), .Data(ALUOut), .Clk(CLK));

    Mux2Bit MuxResult(.sel1(ALUOut), .sel2(DataMem), .sel3(ALUresult), .sel4(immExOut), .ResultSrc(ResultSrc), .Result(Result));

endmodule