// 16 bit register
module Register(input clk, input load, input [15:0] in, output [15:0] out);
genvar i;
generate for(i=0; i<16; i=i+1) begin
    Bit bit(.clk(clk), .load(load), .in(in[i]), .out(out[i]));
end endgenerate
endmodule