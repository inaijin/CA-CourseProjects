module DataPath(CLK,PCSrc, branch,jalr, jump, sel, ResultSrc, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite, op, func3, func7, zero);

    input CLK,PCSrc, MemWrite, ALUSrc, RegWrite, branch, jump,jalr, sel;
    input[1:0] ResultSrc;
    input[2:0] ImmSrc;
    input[3:0] ALUControl;
    output zero, op, func3, func7;
    reg zero;
    reg[6:0] op;
    reg[2:0] func3;
    reg[6:0] func7;

    wire [31:0] jalrMuxOut,pcOut,IMOut,Result,rd1Out,rd2Out,immExOut,muxSrcOut,ALUresult,DMOut,mux2BitRes,PC4,PCimm,pcMuxOut;
    wire Z;

    assign op = IMOut[6:0];
    assign func3 = IMOut[14:12];
    assign func7 = IMOut[31:25];
    assign zero = Z;

    PC pc(.PCIn(jalrMuxOut), .PCOut(pcOut), .Clk(CLK));
   
    InstructionMem im(.dataIn(pcOut), .dataOut(IMOut));
    
    RegisterFile rf(.A1(IMOut[19:15]), .A2(IMOut[24:20]), .A3(IMOut[11:7]), .WD3(Result), .RD1(rd1Out), .RD2(rd2Out), .WE3(RegWrite), .Clk(CLK));
    
    Mux1Bit alusrc(.sel1(rd2Out), .sel2(immExOut), .sel(ALUSrc), .res(muxSrcOut));
    
    Mux2Bit mux2bit(.ALUResult(ALUresult), .ReadData(DMOut),.ImmExt(immExOut), .ResultSrc(ResultSrc), .Result(mux2BitRes), .PCPlus4(32'bx));
    
    Mux1Bit result(.sel1(mux2BitRes), .sel2(PC4), .sel(sel), .res(Result));
    
    Mux1Bit pcmux(.sel1(PC4), .sel2(PCimm), .sel(PCSrc), .res(pcMuxOut));

    Mux1Bit pcin(.sel1(pcMuxOut), .sel2(ALUresult), .sel(jalr), .res(jalrMuxOut));
    
    Adder immadd(.input1(immExOut), .input2(pcOut), .result(PCimm));

    Adder pcadd(.input1(pcOut), .input2(32'd4), .result(PC4));

    ImmExtender immex(.Imm(IMOut[31:7]), .ImmSrc(ImmSrc), .ImmExt(immExOut));

    DataMemory dm(.dataIn(ALUresult), .WD(rd2Out), .WE(MemWrite), .Clk(CLK), .readData(DMOut));

    ALU alu(.SrcA(rd1Out), .SrcB(muxSrcOut), .ALUControl(ALUControl), .ALUResult(ALUresult), .Zero(Z));

endmodule