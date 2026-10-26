module mux4_tb;
    reg i0, i1, i2, i3;
    reg [1:0] sel;
    reg expected;
    wire out;
    integer i;
    integer errors;
    mux4 dut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .sel(sel),
        .out(out)
    );
    initial begin
        $dumpfile("mux4.vcd");
        $dumpvars(0, mux4_tb);
        errors = 0;
        for (i = 0; i < 16; i = i + 1) begin
            {i0, i1, i2, i3} = i;
            for (integer j = 0; j < 4; j = j + 1) begin
                sel = j;
                #10;
                case (sel)
                    2'b00: expected = i0;
                    2'b01: expected = i1;
                    2'b10: expected = i2;
                    2'b11: expected = i3;
                endcase
                if (out !== expected) begin
                    $display(
                        "FAIL: inputs=%b sel=%b expected=%b got=%b",
                        {i0, i1, i2, i3}, sel, expected, out
                    );
                    errors = errors + 1;
                end
            end
        end

        if (errors == 0)
            $display("ALL 64 TESTS PASSED!");
        else
            $display("TESTS FAILED: %0d errors", errors);
        $finish;
    end
endmodule