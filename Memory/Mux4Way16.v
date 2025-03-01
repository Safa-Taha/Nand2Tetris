// 4 way 16-bit Mux
module Mux4Way16(
    input [15:0] a,b,c,d,
    input [1:0] sel,
    output [15:0] out
);
assign out = (sel == 2'd0) ? a :
             (sel == 2'd1) ? b :
             (sel == 2'd2) ? c : d;
endmodule