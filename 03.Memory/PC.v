// PC.v
module PC(
    input         clk,
    input         load,
    input         inc,
    input         reset,
    input  [14:0] in,
    output [14:0] out
);
    wire [14:0] next;
    assign next = reset ? 15'b0 :
                  load  ? in :
                  inc   ? out + 1 : out;

    // Assume a parameterized Register module (width = 15)
    Register #(15) pc_reg (
        .clk(clk),
        .load(1'b1),
        .in(next),
        .out(out)
    );
endmodule
