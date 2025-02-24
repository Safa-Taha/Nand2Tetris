// 16-bit 2:1 Multiplexer
module MUX16bit (
    input [15:0] A,
    input [15:0] B,
    input sel,
    output [15:0] Y
);
    assign Y = sel ? B : A;
endmodule