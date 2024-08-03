module RegCtrE(RegWriteD, ResSrcD, MemWriteD, JumpD, BranchD, AluCtrD, AluSrcD, JalrD, selD, RegWriteE, ResSrcE, MemWriteE, JumpE, BranchE, AluCtrE, AluSrcE, JalrE, selE, Clk, CLR);
    
    input RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD, JalrD, Clk, selD, CLR;
    input[1:0] ResSrcD;
    input[3:0] AluCtrD;
    output RegWriteE, ResSrcE, MemWriteE, JumpE, BranchE, AluCtrE, AluSrcE, JalrE, selE;
    reg RegWriteE = 0, MemWriteE = 0, JumpE = 0, BranchE = 0, AluSrcE = 0, JalrE = 0, selE = 0;
    reg[1:0] ResSrcE = 0;
    reg[3:0] AluCtrE = 0;

    always@(posedge Clk) begin
        if(CLR)
            {RegWriteE, ResSrcE, MemWriteE, JumpE, BranchE, AluCtrE, AluSrcE, JalrE, selE} = 0;
        else begin
            RegWriteE <= RegWriteD;
            ResSrcE <= ResSrcD;
            MemWriteE <= MemWriteD;
            JumpE <= JumpD;
            BranchE <= BranchD;
            AluCtrE <= AluCtrD;
            AluSrcE <= AluSrcD;
            JalrE <= JalrD;
        end
    end
    
endmodule