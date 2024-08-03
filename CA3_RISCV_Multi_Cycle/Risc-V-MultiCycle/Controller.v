`define S0 5'd0
`define S1 5'd1
`define S2 5'd2
`define S3 5'd3
`define S4 5'd4
`define S5 5'd5
`define S6 5'd6
`define S7 5'd7
`define S8 5'd8
`define S9 5'd9
`define S10 5'd10
`define S11 5'd11
`define S12 5'd12
`define S13 5'd13
`define S14 5'd14
`define S15 5'd15
`define S16 5'd16
`define S17 5'd17
`define S18 5'd18
`define S19 5'd19
`define S20 5'd20
`define S21 5'd21
`define S22 5'd22
`define S23 5'd23
`define S24 5'd24
`define S25 5'd25
`define S26 5'd26
`define S27 5'd27
`define S28 5'd28
`define S29 5'd29
`define S30 5'd30

module Controller(op, func3, func7, Zero, PCSrc, branch, jalr, ResultSrc, MemWrite, ALUControl, ALUSrcA, ALUSrcB, ImmSrc, RegWrite, AdrSrc, IrWrite, clk);

    input[6:0] op;
    input[14:12] func3;
    input[31:25] func7;
    input Zero, clk;
    output PCSrc, ResultSrc, MemWrite, ALUControl, ALUSrcA, ALUSrcB, ImmSrc, RegWrite, branch, jalr, AdrSrc, IrWrite;
    reg PCSrc, MemWrite, ALUSrc, RegWrite, branch, jalr, AdrSrc, IrWrite;
    reg[1:0] ResultSrc, ALUSrcA, ALUSrcB;
    reg[2:0] ImmSrc;
    reg[3:0] ALUControl;

    reg[4:0] ps = 5'b0, ns;

    always@(posedge clk)
        ps = ns;

    always@(ps, op, func3, func7, Zero) begin
        case(ps)
            `S0: ns = `S1;
            `S1: begin
                case(op)
                    7'd0: ns = `S2;
                    7'd1: ns = `S3;
                    7'd2: ns = `S4;
                    7'd3: ns = `S5;
                    7'd4: ns = `S6;
                    7'd5: ns = `S7;
                    7'd6: ns = `S8;
                    7'd7: ns = `S9;
                    7'd8: ns = `S10;
                    7'd9: ns = `S11;
                    7'd10: ns = `S12;
                    7'd11: ns = `S13;
                    7'd12: ns = `S14;
                    7'd13: ns = `S15;
                    7'd14: ns = `S16;
                    7'd15: ns = `S17;
                    7'd16: ns = `S18;
                    7'd17: ns = `S19;
                    default: ns = `S0;
                endcase
            end                
            `S2: ns = `S20;
            `S3: ns = `S20;
            `S4: ns = `S20;
            `S5: ns = `S20;
            `S6: ns = `S20;
            `S20: ns = `S0;
            `S7: ns = `S21;
            `S21: ns = `S22;
            `S22: ns = `S0;
            `S8: ns = `S23;
            `S9: ns = `S23;
            `S10: ns = `S23;
            `S11: ns = `S23;
            `S23: ns = `S0;
            `S12: ns = `S24;
            `S24: ns = `S25;
            `S25: ns = `S26;
            `S26: ns = `S0;
            `S13: ns = `S27;
            `S27: ns = `S0;
            `S14: ns = `S28;
            `S28: ns = `S29;
            `S29: ns = `S30;
            `S30: ns = `S0;
            `S15: ns = `S0;
            `S16: ns = `S0;
            `S17: ns = `S0;
            `S18: ns = `S0;
            `S19: ns = `S0;
        endcase
    end

    always@(ps) begin
        {PCSrc, ResultSrc, MemWrite, ALUControl, ALUSrcA, ALUSrcB, ImmSrc, RegWrite, branch, jalr, AdrSrc, IrWrite} = 0;
        case(ps)
            `S0:{AdrSrc, IrWrite, ALUSrcA, ALUSrcB, ALUControl, ResultSrc, PCSrc} = 13'b0100100000101;
            `S1:{ALUSrcA, ALUSrcB, ImmSrc, ALUControl} = 11'b01010100000;
            `S2:{ALUSrcA, ALUSrcB, ALUControl} = 8'b10000000;
            `S3:{ALUSrcA, ALUSrcB, ALUControl} = 8'b10000001;
            `S4:{ALUSrcA, ALUSrcB, ALUControl} = 8'b10000010;
            `S5:{ALUSrcA, ALUSrcB, ALUControl} = 8'b10000011;
            `S6:{ALUSrcA, ALUSrcB, ALUControl} = 8'b10001111;
            `S7:{ImmSrc, ALUSrcA, ALUSrcB, ALUControl} = 11'b00010010000;
            `S8:{ALUSrcA, ALUSrcB, ImmSrc, ALUControl} = 11'b10010000000;
            `S9:{ALUSrcA, ALUSrcB, ImmSrc, ALUControl} = 11'b10010000111;
            `S10:{ALUSrcA, ALUSrcB, ImmSrc, ALUControl} = 11'b10010000011;
            `S11:{ALUSrcA, ALUSrcB, ImmSrc, ALUControl} = 11'b10010001111;
            `S12:{ALUSrcA, ALUSrcB, ALUControl} = 8'b01100000;
            `S13:{ImmSrc, ALUSrcA, ALUSrcB, ALUControl} = 11'b00110010000;
            `S14:{ALUSrcA, ALUSrcB, ALUControl} = 8'b01100000;
            `S15:{ALUSrcA, ALUSrcB, ResultSrc, branch, ALUControl} = 11'b10000010001;
            `S16:{ALUSrcA, ALUSrcB, ResultSrc, branch, ALUControl} = 11'b10000010101;
            `S17:{ALUSrcA, ALUSrcB, ResultSrc, branch, ALUControl} = 11'b10000010100;
            `S18:{ALUSrcA, ALUSrcB, ResultSrc, branch, ALUControl} = 11'b10000010110;
            `S19:{ImmSrc, ResultSrc, RegWrite} = 6'b111111;
            `S20:{ResultSrc, RegWrite} = 3'b001;
            `S21:{ResultSrc, AdrSrc} = 3'b001;
            `S22:{ResultSrc, RegWrite} = 3'b011;
            `S23:{ResultSrc, RegWrite} = 3'b001;
            `S24:{ResultSrc, RegWrite} = 3'b001;
            `S25:{ALUSrcA, ALUSrcB, ImmSrc, ALUControl} = 11'b10010000000;
            `S26:{ResultSrc, PCSrc} = 3'b001;
            `S27:{ResultSrc, AdrSrc, IrWrite} = 3'b0011;
            `S28:{ResultSrc, RegWrite} = 3'b001;
            `S29:{ALUSrcA, ALUSrcB, ImmSrc, ALUControl} = 11'b01010110000;
            `S30:{ResultSrc, PCSrc} = 3'b001;
        endcase
    end

endmodule