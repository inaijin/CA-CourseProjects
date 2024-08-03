module RegRF(RD1, RD2, A, B, Clk);

    input[31:0] RD1, RD2;
    input Clk;
    output A, B;
    reg[31:0] A, B;

    always@(posedge Clk) begin
        A <= RD1;
        B <= RD2;
    end

endmodule