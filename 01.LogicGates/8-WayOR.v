// 8-way OR Gate
module OR_8way (
    input [7:0] A,
    output Y
);
    assign Y = |A;
endmodule