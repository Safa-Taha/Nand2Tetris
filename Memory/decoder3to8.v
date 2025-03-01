// 3 to 8 decoder
module decoder3to8(input [2:0] sel, output [7:0] out);
assign out = 8'b1 << sel;
endmodule