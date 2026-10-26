`timescale 1ns/1ps

module d_flip_flop_tb;

    reg d, clk, rst;
    wire q;
    integer errors;

    d_flip_flop dut (
        .q(q),
        .d(d),
        .clk(clk),
        .rst(rst)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("d_flip_flop.vcd");
        $dumpvars(0, d_flip_flop_tb);

        errors = 0;
        d = 0;
        rst = 1;

        @(posedge clk);
        #1;
        if (q !== 1'b0) begin
            $display("FAIL: Reset, q=%b", q);
            errors = errors + 1;
        end else begin
            $display("PASS: Reset");
        end

        @(negedge clk);
        rst = 0;
        d = 1;

        @(posedge clk);
        #1;
        if (q !== 1'b1) begin
            $display("FAIL: Store 1, q=%b", q);
            errors = errors + 1;
        end else begin
            $display("PASS: Store 1");
        end

        @(negedge clk);
        d = 0;
        #1;
        if (q !== 1'b1) begin
            $display("FAIL: Hold value, q=%b", q);
            errors = errors + 1;
        end else begin
            $display("PASS: Hold value");
        end

        @(posedge clk);
        #1;
        if (q !== 1'b0) begin
            $display("FAIL: Store 0, q=%b", q);
            errors = errors + 1;
        end else begin
            $display("PASS: Store 0");
        end

        @(negedge clk);
        d = 1;
        rst = 1;

        @(posedge clk);
        #1;
        if (q !== 1'b0) begin
            $display("FAIL: Reset priority, q=%b", q);
            errors = errors + 1;
        end else begin
            $display("PASS: Reset priority");
        end

        if (errors == 0)
            $display("ALL TESTS PASSED!");
        else
            $display("TESTS FAILED: %0d errors", errors);

        $finish;
    end

endmodule
