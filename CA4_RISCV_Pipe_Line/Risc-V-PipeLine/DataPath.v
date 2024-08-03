module DataPath(CLK,PCSrc, branch,jalr, jump, sel, ResultSrc, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite, op, func3, func7, zero, stallF, StallD, FlushD, FlushE, forwardAE, forwardBE, Rs1DD, Rs2DD, RdEE, Rs2EE, Rs1EE, PCSrcE, RdMM, RdWW, RegWriteWW, RegWriteMM, ResultSrcE0E);

    input CLK,PCSrc, MemWrite, ALUSrc, RegWrite, branch, jump,jalr, sel, stallF, StallD, FlushD, FlushE;
    input[1:0] ResultSrc, forwardAE, forwardBE;
    input[2:0] ImmSrc;
    input[3:0] ALUControl;
    output zero, op, func3, func7, Rs1DD, Rs2DD, RdEE, Rs2EE, Rs1EE, PCSrcE, RdMM, RdWW, RegWriteMM, RegWriteWW, ResultSrcE0E;
    reg zero, RegWriteMM, RegWriteWW, ResultSrcE0E;
    reg[4:0] Rs1DD, Rs2DD, RdEE, Rs2EE, Rs1EE, RdMM, RdWW;
    reg[6:0] op;
    reg[2:0] func3;
    reg[6:0] func7;

    reg PCSrcE = 0;

    wire [31:0] jalrMuxOut,pcOut,IMOut,Result,rd1Out,rd2Out,immExOut,muxSrcOut,ALUresult,DMOut,mux2BitRes,PC4,PCimm,pcMuxOut;
    wire Z;
    wire [31:0] InstrD, PCD, PC4D, RD1E, RD2E, PCE, ExtImmE, PC4E, SrcA, SrcB, ALUResM, WriteDataM, ImmM, PC4M, ALUResW, ReadDataW, ImmW, PC4W;
    wire RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE, JalrE, MemWriteM, JalrM, RegWriteW, JalrW, selE, selM, selW, RegWriteM;
    wire[1:0] ResSrcE, ResSrcM, ResSrcW;
    wire[3:0] AluCtrE;
    wire [4:0] Rs1E, Rs2E, RdE, RdM, RdW;

    always@*begin
        if(((Z & BranchE) | JumpE) == 1'bx)
            assign PCSrcE = 0;
        else
            assign PCSrcE = ((Z & BranchE) | JumpE);
    end

    assign op = InstrD[6:0];
    assign func3 = InstrD[14:12];
    assign func7 = InstrD[31:25];
    assign zero = Z;
    assign Rs1DD = InstrD[19:15];
    assign Rs2DD = InstrD[24:20];
    assign RdEE = RdE;
    assign Rs2EE = Rs2E;
    assign Rs1EE = Rs1E;
    assign RdMM = RdM;
    assign RdWW = RdW;
    assign RegWriteMM = RegWriteM;
    assign RegWriteWW = RegWriteW;
    assign ResultSrcE0E = ResSrcE[0];

    PC pc(.PCIn(jalrMuxOut), .PCOut(pcOut), .Clk(CLK), .EN(stallF));
   
    InstructionMem im(.dataIn(pcOut), .dataOut(IMOut));
    
    RegDpD RDD(.inst(IMOut), .pc(pcOut), .pc4(PC4), .instrD(InstrD), .PCD(PCD), .PC4D(PC4D), .Clk(CLK), .EN(StallD), .CLR(FlushD));

    RegDpE RDEE(.RD1(rd1Out), .RD2(rd2Out), .PCD(PCD), .Rs1D(InstrD[19:15]), .Rs2D(InstrD[24:20]), .RdD(InstrD[11:7]), .ExtImmD(immExOut), .PC4D(PC4D), .RD1E(RD1E), .RD2E(RD2E), .PCE(PCE), .Rs1E(Rs1E), .Rs2E(Rs2E), .RdE(RdE), .ExtImmE(ExtImmE), .PC4E(PC4E), .Clk(CLK), .CLR(FlushE));

    Mux2Bit Muxrd1E(.ALUResult(RD1E), .ReadData(mux2BitRes), .PCPlus4(ALUResM), .ImmExt(32'bz), .ResultSrc(forwardAE), .Result(SrcA));

    Mux2Bit Muxrd2E(.ALUResult(RD2E), .ReadData(mux2BitRes), .PCPlus4(ALUResM), .ImmExt(32'bz), .ResultSrc(forwardBE), .Result(SrcB));

    RegDpM RDMM(.ALURes(ALUresult), .WriteDataE(SrcB), .RdE(RdE), .ImmE(ExtImmE), .PC4E(PC4E), .ALUResM(ALUResM), .WriteDataM(WriteDataM), .RdM(RdM), .ImmM(ImmM), .PC4M(PC4M), .Clk(CLK));

    RegDpW RDWW(.ALUResM(ALUResM), .ReadData(DMOut), .RdM(RdM), .ImmM(ImmM), .PC4M(PC4M), .ALUResW(ALUResW), .ReadDataW(ReadDataW), .RdW(RdW), .ImmW(ImmW), .PC4W(PC4W), .Clk(CLK));

    RegCtrE RCEE(.RegWriteD(RegWrite), .ResSrcD(ResultSrc), .MemWriteD(MemWrite), .JumpD(jump), .BranchD(branch), .AluCtrD(ALUControl), .AluSrcD(ALUSrc), .JalrD(jalr), .RegWriteE(RegWriteE), .ResSrcE(ResSrcE), .MemWriteE(MemWriteEl), .JumpE(JumpE), .BranchE(BranchE), .AluCtrE(AluCtrE), .AluSrcE(AluSrcE), .JalrE(JalrE), .Clk(CLK), .selD(sel), .selE(selE), .CLR(FlushE));

    RegCtrM RCMM(.RegWriteE(RegWriteE), .ResSrcE(ResSrcE), .MemWriteE(MemWriteE), .JalrE(JalrE), .RegWriteM(RegWriteM), .ResSrcM(ResSrcM), .MemWriteM(MemWriteM), .JalrM(JalrM), .Clk(CLK), .selE(selE), .selM(selM));

    RegCtrW RCWW(.RegWriteM(RegWriteM), .ResSrcM(ResSrcM), .JalrM(JalrM), .RegWriteW(RegWriteW), .ResSrcW(ResSrcW), .JalrW(JalrW), .Clk(CLK), .selM(selM), .selW(selW));
    
    RegisterFile rf(.A1(InstrD[19:15]), .A2(InstrD[24:20]), .A3(RdW), .WD3(Result), .RD1(rd1Out), .RD2(rd2Out), .WE3(RegWriteW), .Clk(CLK));
    
    Mux1Bit alusrc(.sel1(SrcB), .sel2(ExtImmE), .sel(AluSrcE), .res(muxSrcOut));
    
    Mux2Bit mux2bit(.ALUResult(ALUResW), .ReadData(ReadDataW), .ImmExt(ImmW), .ResultSrc(ResSrcW), .Result(mux2BitRes), .PCPlus4(32'bx));
    
    Mux1Bit result(.sel1(mux2BitRes), .sel2(PC4W), .sel(selW), .res(Result));
    
    Mux1Bit pcmux(.sel1(PC4), .sel2(PCimm), .sel(PCSrcE), .res(pcMuxOut));

    Mux1Bit pcin(.sel1(pcMuxOut), .sel2(ALUResW), .sel(JalrE), .res(jalrMuxOut));
    
    Adder immadd(.input1(ExtImmE), .input2(PCE), .result(PCimm));

    Adder pcadd(.input1(pcOut), .input2(32'd4), .result(PC4));

    ImmExtender immex(.Imm(InstrD[31:7]), .ImmSrc(ImmSrc), .ImmExt(immExOut));

    DataMemory dm(.dataIn(ALUResM), .WD(WriteDataM), .WE(MemWriteM), .Clk(CLK), .readData(DMOut));

    ALU alu(.SrcA(SrcA), .SrcB(muxSrcOut), .ALUControl(AluCtrE), .ALUResult(ALUresult), .Zero(Z));

endmodule