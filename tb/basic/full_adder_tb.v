
module full_adder_tb;

    reg a, b, cin;
    reg [1:0] expected;

    wire sum, cout;
    integer i;
    integer errors;

    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);

        errors = 0;
        a = 0;
        b = 0;
        cin = 0;

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i;
            #10;

            expected = a + b + cin;

            if ({cout, sum} !== expected) begin
                $display(
                    "FAIL: a=%b b=%b cin=%b | expected=%b got=%b",
                    a, b, cin, expected, {cout, sum}
                );
                errors = errors + 1;
            end else begin
                $display(
                    "PASS: a=%b b=%b cin=%b | result=%b",
                    a, b, cin, {cout, sum}
                );
            end
        end

        if (errors == 0)
            $display("ALL TESTS PASSED!");
        else
            $display("TESTS FAILED: %0d errors", errors);

        $finish;
    end

endmodule
