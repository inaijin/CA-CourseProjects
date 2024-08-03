module tb();
    reg clk = 0;

    TopLevel tp(.Clk(clk));
    always #5 clk = ~clk;
    initial begin
        #650 $stop;
    end

endmodule