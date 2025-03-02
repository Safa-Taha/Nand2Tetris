// 16-bit AND Gate
module AND16bit (
    input [15:0] A,
    input [15:0] B,
    output [15:0] Y
);
    assign Y = A & B;
endmodule