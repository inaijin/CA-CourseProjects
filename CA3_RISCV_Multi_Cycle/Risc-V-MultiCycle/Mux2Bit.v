module Mux2Bit(sel1, sel2, sel3, sel4, ResultSrc, Result);

    input[31:0] sel1, sel2, sel3, sel4;
    input[1:0] ResultSrc;
    output Result;
    reg[31:0] Result;

    always@(sel1, sel2, sel3, sel4, ResultSrc)
    begin
        case(ResultSrc)
            2'b00: Result = sel1;
            2'b01: Result = sel2;
            2'b10: Result = sel3;
            2'b11: Result = sel4;
            default: Result = 32'bx;
        endcase
    end

endmodule