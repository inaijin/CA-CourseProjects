module DataMemory(dataIn, WD, WE, Clk, readData);
    
    input[31:0] dataIn, WD;
    input WE, Clk;
    output readData;
    reg[31:0] readData;

    reg[31:0] datas[0:63];

    initial begin

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

    always@(posedge Clk)
        if(WE)
            datas[dataIn] <= WD;

    always@(dataIn, WD, WE, Clk)
        readData <= datas[dataIn];
        
endmodule