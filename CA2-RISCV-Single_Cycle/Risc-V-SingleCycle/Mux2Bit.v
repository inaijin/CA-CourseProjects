module Mux2Bit(ALUResult, ReadData, PCPlus4, ImmExt, ResultSrc, Result);

    input[31:0] ALUResult, ReadData, PCPlus4, ImmExt;
    input[1:0] ResultSrc;
    output Result;
    reg[31:0] Result;

    always@(ALUResult, ReadData, PCPlus4, ImmExt, ResultSrc)
    begin
        case(ResultSrc)
            2'b00: Result = ALUResult;
            2'b01: Result = ReadData;
            2'b10: Result = PCPlus4;
            2'b11: Result = ImmExt;
            default: Result = 32'bx;
        endcase
    end

endmodule