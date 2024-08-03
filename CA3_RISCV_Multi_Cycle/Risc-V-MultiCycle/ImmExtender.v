module ImmExtender(Imm, ImmSrc, ImmExt);

    input[31:7] Imm;
    input[2:0] ImmSrc;
    output ImmExt;
    reg[31:0] ImmExt;

    always@(Imm,ImmSrc)
    begin
        case(ImmSrc)
            3'b000: ImmExt = {{20{Imm[31]}},Imm[31:20]};
            3'b001: ImmExt = {{20{Imm[31]}},Imm[31:25],Imm[11:7]};
            3'b010: ImmExt = {{19{Imm[31]}},Imm[31],Imm[7],Imm[30:25],Imm[11:8],2'b0};
            3'b011: ImmExt = {{11{Imm[31]}},Imm[31],Imm[19:12],Imm[20],Imm[30:21],1'b0};
            3'b111: ImmExt = {{12{Imm[31]}},Imm[31:12]};
            default: ImmExt = 32'bx;
        endcase
    end
    
endmodule