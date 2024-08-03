module tb();
    reg clk = 0;

    TopLevel tp(.Clk(clk));
    always #5 clk = ~clk;
    initial begin
        #1100 $stop;
    end

endmodule