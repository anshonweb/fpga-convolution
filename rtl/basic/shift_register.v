
module shift_register_4(
    input clk,
    input rst,
    input serial_in,
    output serial_out
);

    reg [3:0] data;

    always @(posedge clk) begin
        if (rst)
            data <= 4'b0000;
        else
            data <= {data[2:0], serial_in};
    end
    assign serial_out = data[3];

endmodule
