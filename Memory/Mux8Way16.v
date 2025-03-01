// 8 way 16-bit Mux
module Mux8Way16(
    input [15:0] a,b,c,d,e,f,g,h,
    input [2:0] sel,
    output [15:0] out
);
assign out = (sel == 3'd0) ? a :
             (sel == 3'd1) ? b :
             (sel == 3'd2) ? c :
             (sel == 3'd3) ? d :
             (sel == 3'd4) ? e :
             (sel == 3'd5) ? f :
             (sel == 3'd6) ? g : h;
endmodule