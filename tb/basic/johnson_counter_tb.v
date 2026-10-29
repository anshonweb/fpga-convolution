
`timescale 1ns/1ps

module johnson_counter_tb;

    reg clk;
    reg rst;
    wire [3:0] q;
    integer errors;
    
    johnson_counter dut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("johnson_counter.vcd");
        $dumpvars(0, johnson_counter_tb);

        errors = 0;
        rst = 1;
        //reset
        @(posedge clk);
        #1;
        if (q !== 4'b0000) begin
            $display("FAIL: Reset, q=%b", q);
            errors = errors + 1;
        end else begin
            $display("PASS: Reset");
        end
        @(negedge clk);
        rst = 0;
        check_state(4'b0001);
        check_state(4'b0011);
        check_state(4'b0111);
        check_state(4'b1111);
        check_state(4'b1110);
        check_state(4'b1100);
        check_state(4'b1000);
        check_state(4'b0000);

        if (errors == 0)
            $display("ALL TESTS PASSED!");
        else
            $display("TESTS FAILED: %0d errors", errors);

        $finish;
    end
    //next state checker
    task check_state(input [3:0] expected);
        begin
            @(posedge clk);
            #1;

            if (q !== expected) begin
                $display(
                    "FAIL: Expected %b, got %b at time %0t",
                    expected, q, $time
                );
                errors = errors + 1;
            end else begin
                $display("PASS: q = %b", q);
            end
        end
    endtask

endmodule
