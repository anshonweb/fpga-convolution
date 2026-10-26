module mux4(
    input i0,
    input i1,
    input i2,
    input i3,
    output out,
    input [1:0] sel  
);

    assign out = ~sel[1]&~sel[0]&i0 | ~(sel[1])&sel[0]&i1 | sel[1]&~sel[0]&i2 | sel[1]&sel[0]&i3;

endmodule