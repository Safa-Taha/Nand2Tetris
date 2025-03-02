// 8 entry RAM
module RAM8(input clk, input load, input [2:0] address, 
            input [15:0] in, output [15:0] out);

wire [7:0] load_bits;
wire [15:0] reg_out [7:0];

decoder3to8 decoder(.sel(address), .out(load_bits));
generate genvar i;
for(i=0; i<8; i=i+1) begin
    Register reg_inst(.clk(clk), .load(load & load_bits[i]), 
                     .in(in), .out(reg_out[i]));
end endgenerate
Mux8Way16 mux(.a(reg_out[0]), .b(reg_out[1]), .c(reg_out[2]), .d(reg_out[3]),
              .e(reg_out[4]), .f(reg_out[5]), .g(reg_out[6]), .h(reg_out[7]), 
              .sel(address), .out(out));
endmodule