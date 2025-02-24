// 1:4 DEMUX
module DEMUX (
    input in,
    input [1:0] sel,
    output reg [3:0] Y
);
    always @(*) begin
        Y = 4'b0000;
        case (sel)
            2'b00: Y[0] = in;
            2'b01: Y[1] = in;
            2'b10: Y[2] = in;
            2'b11: Y[3] = in;
        endcase
    end
endmodule