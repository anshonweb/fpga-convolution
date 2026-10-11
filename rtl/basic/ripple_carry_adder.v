module ripple_carry_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

    wire carry1, carry2, carry3;

    full_adder fa0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(carry1)
    );

    full_adder fa1(
        .a(a[1]),
        .b(b[1]),
        .cin(carry1),
        .sum(sum[1]),
        .cout(carry2)
    );

    full_adder fa2(
        .a(a[2]),
        .b(b[2]),
        .cin(carry2),
        .sum(sum[2]),
        .cout(carry3)
    );

    full_adder fa3(
        .a(a[3]),
        .b(b[3]),
        .cin(carry3),
        .sum(sum[3]),
        .cout(cout)
    );


endmodule
