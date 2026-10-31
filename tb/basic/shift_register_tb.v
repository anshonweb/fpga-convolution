
`timescale 1ns/1ps

module shift_register_4_tb;

    reg clk;
    reg rst;
    reg serial_in;
    wire serial_out;

    shift_register_4 dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    initial begin //initialize clock.
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("shift_register.vcd");
        $dumpvars(0, shift_register_4_tb);

        rst = 1;
        serial_in = 0;
        @(posedge clk);
        #1;
        rst = 0;

        serial_in = 1;
        @(posedge clk);
        #1;
        $display("Output = %b", serial_out);

        serial_in = 0;
        @(posedge clk);
        #1;
        $display("Output = %b", serial_out);

        serial_in = 1;
        @(posedge clk);
        #1;
        $display("Output = %b", serial_out);

        serial_in = 1;
        @(posedge clk);
        #1;
        $display("Output = %b", serial_out);

        repeat (4) begin
            serial_in = 0;
            @(posedge clk);
            #1;
            $display("Output = %b", serial_out);
        end

        $finish;
    end

endmodule
