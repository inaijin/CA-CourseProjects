module Mux1Bit(sel1, sel2, sel, res);

    input[31:0] sel1, sel2;
    input sel;
    output res;
    reg[31:0] res;

    always@(sel1, sel2, sel)
    begin
        case(sel)
            1'b0: res = sel1;
            1'b1: res = sel2;
            default: res = 32'bx;
        endcase
    end
    
endmodule