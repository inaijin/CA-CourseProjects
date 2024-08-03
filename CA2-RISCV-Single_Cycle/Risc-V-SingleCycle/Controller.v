module Controller(op, func3, func7, Zero, PCSrc, branch, jump,jalr, sel, ResultSrc, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite);

    input[6:0] op;
    input[14:12] func3;
    input[31:25] func7;
    input Zero;
    output PCSrc, ResultSrc, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite, branch, jump,jalr, sel;
    reg PCSrc, MemWrite, ALUSrc, RegWrite, branch, jump,jalr, sel;
    reg[1:0] ResultSrc;
    reg[2:0] ImmSrc;
    reg[3:0] ALUControl;

    always@(op,func3,func7,Zero)
    begin
    assign PCSrc = (Zero & branch) | jump;
        case(op)
            7'd0: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1xxx000000000000;
            7'd1: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1xxx000000001000;
            7'd2: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1xxx000000010000;
            7'd3: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1xxx000000011000;
            7'd4: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1xxx000001111000;

            7'd5: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1000100100000000;
            7'd6: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1000100000000000;
            7'd7: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1000100000111000;
            7'd8: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1000100000011000;
            7'd9: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1000100001111000;
            7'd10: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b100010xxx00001x1;

            7'd11: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b000111xx00000000;

            7'd12: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1011x0xx0xxxx110;

            7'd13: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b001000xx10001000;
            7'd14: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b001000xx10101000;
            7'd15: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b001000xx10100000;
            7'd16: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b001000xx10110000;

            7'd17: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'b1111x0110xxxx000;
            default: {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,branch,ALUControl,sel,jump,jalr} = 16'dx;
        endcase
    end
    
endmodule