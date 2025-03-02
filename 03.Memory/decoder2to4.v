// 2 to 4 decoder
module decoder2to4(input [1:0] sel, output [3:0] out);
assign out = 4'b1 << sel;
endmodule