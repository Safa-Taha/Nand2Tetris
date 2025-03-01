// 16K entry RAM
module RAM16K(input clk, input load, input [13:0] address, 
              input [15:0] in, output [15:0] out);

wire [3:0] load_bits;
wire [15:0] ram_out [3:0];
wire [1:0] sel = address[13:12];

decoder2to4 decoder(.sel(sel), .out(load_bits));

generate genvar i;
for(i=0; i<4; i=i+1) begin
    RAM4K ram4k_inst(.clk(clk), .load(load & load_bits[i]), 
                    .address(address[11:0]), .in(in), .out(ram_out[i]));
end endgenerate

Mux4Way16 mux(.a(ram_out[0]), .b(ram_out[1]), .c(ram_out[2]), .d(ram_out[3]), 
              .sel(sel), .out(out));
endmodule