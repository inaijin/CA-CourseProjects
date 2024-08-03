module InstructionMem(dataIn, dataOut);

    input[31:0] dataIn;
    output dataOut;
    reg[31:0] dataOut;

    reg[31:0] InstMem[0:63];


    initial begin
        
        InstMem[0] = 32'b00000000000000001xxx000010000110;
        InstMem[4] = 32'b00000000000000010xxx000100000110;
        InstMem[8] = 32'b00000010100000011xxx000110000110;
        InstMem[12] = 32'b00000000001100010xxx110100010000;
        InstMem[16] = 32'b00000000000000010xxx001000000101;
        InstMem[20] = 32'b00000000010000001xxx001000010000;
        InstMem[24] = 32'b00000000000000100xxx000010000110;
        InstMem[28] = 32'b00000000010000010xxx000100000110;
        InstMem[32] = 32'b11111110110111111111001010001100;
        
    end

    always@(dataIn)
        dataOut = InstMem[dataIn];
        
endmodule