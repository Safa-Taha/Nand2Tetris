module Bit(input clk, input load, input in, output out);
wire mux_out;
assign mux_out = load ? in : out;
DFF dff(.clk(clk), .d(mux_out), .q(out));
endmodule