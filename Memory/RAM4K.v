// 4K entry RAM
module RAM4K(input clk, input load, input [11:0] address, 
             input [15:0] in, output [15:0] out);

wire [7:0] load_bits;
wire [15:0] ram_out [7:0];
wire [2:0] sel = address[11:9];

decoder3to8 decoder(.sel(sel), .out(load_bits));

generate genvar i;
for(i=0; i<8; i=i+1) begin
    RAM512 ram512_inst(.clk(clk), .load(load & load_bits[i]), 
                      .address(address[8:0]), .in(in), .out(ram_out[i]));
end endgenerate

Mux8Way16 mux(.a(ram_out[0]), .b(ram_out[1]), .c(ram_out[2]), .d(ram_out[3]),
              .e(ram_out[4]), .f(ram_out[5]), .g(ram_out[6]), .h(ram_out[7]), 
              .sel(sel), .out(out));
endmodule

