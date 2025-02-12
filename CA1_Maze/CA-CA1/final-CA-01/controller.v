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

module
Controller(start,run,clk,rst,cout,donecheck,xory,empty,emptya,rev_move,Din,rstdp,rstm,rstrev,push,importdata
,pop,din,WR,RD,ldx,ldy,selectxy,ldrev,backtrack,ldm,Dout,done,fail,pusha,importdataa, popa,rev_move);
input start,run,clk,rst,cout,xory,empty,emptya,rev_move,Dout,donecheck;
output
rstdp,rstm,rstrev,push,pop,din,WR,RD,ldx,ldy,selectxy,ldrev,backtrack,ldm,Din,importdata,done,fail,pusha,importdataa,popa;
reg
rstdp,rstm,rstrev,push,pop,din,WR,RD,ldx,ldy,selectxy,ldrev,backtrack,ldm,Din,importdata,done,fail,pusha,importdataa,popa;
reg[4:0] ps,ns;
always@(posedge clk)
    if(rst)
ps = 5'd0;
    else
ps = ns;
always@(ps,start,run,clk,rst,cout,xory,empty,rev_move,Dout) begin
    case(ps)
`S0:ns = start ? `S1 : run ? `S22 : `S0 ;
`S1:ns = `S2 ;
`S2:ns = `S17 ;
`S17:ns = `S3;
`S3:ns = xory ? `S4 : `S5 ;
`S4:ns = `S6 ;
`S5:ns = `S6 ;
`S6:ns = rev_move ? `S11 : `S7 ;
`S7:ns = Dout ? `S9 : `S8 ;
`S8:ns = `S10 ;
`S9:ns = empty ? `S16 : `S14 ;
`S10:ns = donecheck ? `S18 : `S2;
`S11:ns = `S12 ;
`S12:ns = cout ? `S9 : `S13 ;
`S13:ns = `S2;
`S14:ns = `S15 ;
`S15:ns = `S3 ;
`S16:ns = `S16;
`S18:ns = `S19;
`S19:ns = `S20;
`S20:ns = `S21;
`S21:ns = empty ? `S0 : `S19;
`S22:ns = emptya ? `S0 : `S22;
    endcase
end
always@(ps) begin

{rstdp,rstm,rstrev,push,pop,din,WR,RD,ldx,ldy,selectxy,ldrev,backtrack,ldm,Din,importdata,importdataa,fail,done,pusha,popa}
= 0;
    case(ps)
`S0:;
`S1: {rstdp,rstm,rstrev} = 3'b111;
`S2:{push,Din,WR} = 3'b111;
`S17:importdata = 1'b1;
`S3: ;
`S4:{ldx,selectxy} = 2'b11;
`S5: {ldy,selectxy} = 2'b10;
`S6: ;
`S7: RD = 1'b1;
`S8: ;
`S9:;
`S10: rstm = 1'b1;
`S11: rstrev = 1'b1;
`S12: {Din,WR} = 2'b01;
`S13: ldm = 1'b1;
`S14: {backtrack,ldm} = 2'b11;
`S15: {pop,ldrev} = 2'b11;
`S16: fail = 1;
`S18: done = 1;
`S19: pusha = 1;
`S20: importdataa = 1;
`S21: pop = 1;
`S22: popa = 1;
    endcase
end
endmodule

