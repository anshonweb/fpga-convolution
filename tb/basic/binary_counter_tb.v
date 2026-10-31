
`timescale 1ns/1ps

module binary_counter_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

    binary_counter c0 (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    initial begin //clock generation.
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("binary_counter.vcd");
        $dumpvars(0, binary_counter_tb);

        rst = 1;

        @(posedge clk); //check reset.
        #1;
        if (count !== 4'b0000)
            $display("FAIL: Reset");
        else
            $display("PASS: Reset");

        @(negedge clk);
        rst = 0;
        repeat (16) begin
            @(posedge clk);
            #1;
            $display("Count = %b", count);
        end
        @(negedge clk);
        rst = 1;

        @(posedge clk);
        #1;
        if (count !== 4'b0000)
            $display("FAIL: Reset during counting");
        else
            $display("PASS: Reset during counting");

        $display("Simulation complete!");
        $finish;
    end

endmodule
