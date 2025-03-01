// Program counter
module PC(input clk, input load, input inc, input reset,
          input [15:0] in, output [15:0] out);

wire [15:0] next;
assign next = reset ? 16'b0 :
                 load ? in :
                 inc ? out + 1 : out;
                 
Register pc_reg(.clk(clk), .load(1'b1), .in(next), .out(out));
endmodule