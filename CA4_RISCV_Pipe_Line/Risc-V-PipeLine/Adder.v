module Adder(input1, input2, result);

    input[31:0] input1, input2;
    output result;
    reg[31:0] result;

    always@(input1,input2)
        result = input1 + input2;
    
endmodule