module ripple_carry_adder_tb;

    reg [3:0] a, b;
    reg cin;

    reg [4:0] expected;
    wire [3:0] sum;
    wire cout;

    integer i, j, k;
    integer errors;

    ripple_carry_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0, ripple_carry_adder_tb);
        errors = 0;
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    a = i;
                    b = j;
                    cin = k;
                    #10;
                    expected = a + b + cin;

                    if ({cout, sum} !== expected) begin
                        $display(
                            "FAIL: a=%d b=%d cin=%b expected=%d got=%d",
                            a, b, cin, expected, {cout, sum}
                        );
                        errors = errors + 1;
                    end
                end
            end
        end
        if (errors == 0)
            $display("ALL 512 TESTS PASSED!");
        else
            $display("TESTS FAILED: %0d errors", errors);

        $finish;
    end

endmodule
