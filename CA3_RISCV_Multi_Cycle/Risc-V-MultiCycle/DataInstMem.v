module InstMem(dataIn, WD, WE, Clk, readData, dataOut);

    input[31:0] dataIn, WD;
    input WE, Clk;
    output readData, dataOut;
    reg[31:0] readData, dataOut;

    reg[31:0] InstMem[0:63];
    reg[31:0] datas[0:63];

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

        datas[0] = 32'd10;
        datas[4] = 32'd5;
        datas[8] = 32'd20;
        datas[12] = 32'd12;
        datas[16] = 32'd4;
        datas[20] = 32'd1;
        datas[24] = 32'd100;
        datas[28] = 32'd32;
        datas[32] = 32'd41;
        datas[36] = 32'd73;
    end

    always@(dataIn, WD, WE, Clk) begin
        readData <= datas[dataIn];
        dataOut <= InstMem[dataIn];
    end
    
    always@(posedge Clk)
        if(WE)
            datas[dataIn] <= WD;

endmodule