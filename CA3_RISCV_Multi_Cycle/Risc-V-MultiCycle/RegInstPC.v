module RegInstPC(pc, inst, en, clk, oldPC, instr);

    input[31:0] pc, inst;
    input en, clk;
    output oldPC, instr;
    reg[31:0] oldPC, instr;

    always@(posedge clk)
        if(en) begin
            oldPC <= pc;
            instr <= inst;
        end
endmodule