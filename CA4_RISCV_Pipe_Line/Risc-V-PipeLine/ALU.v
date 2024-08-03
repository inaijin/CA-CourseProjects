module ALU(SrcA, SrcB, ALUControl, ALUResult, Zero);

    input[31:0] SrcA, SrcB;
    input[3:0] ALUControl;
    output ALUResult, Zero;
    reg Zero;
    reg[31:0] ALUResult;

    always@(SrcA, SrcB, ALUControl)
    begin
        case(ALUControl)
            4'b0000: ALUResult = SrcA + SrcB;
            4'b0001: ALUResult = SrcA - SrcB;
            4'b0010: ALUResult = SrcA & SrcB;
            4'b0011: ALUResult = SrcA | SrcB;
            4'b0100: begin
                if(SrcA < SrcB)
                    Zero = 1;
                else
                    Zero = 0;
            end
            4'b0101: begin
                if(SrcA != SrcB)
                    Zero = 1;
                else
                    Zero = 0;
            end
            4'b0110: begin
                if(SrcA >= SrcB)
                    Zero = 1;
                else
                    Zero = 0;
            end
            4'b0111: ALUResult = SrcA ^ SrcB;
            4'b1111: begin
                if(SrcA < SrcB)
                    ALUResult = 1;
                else
                    ALUResult = 0;
            end
            default: ALUResult = 32'bx;
        endcase
    end

endmodule