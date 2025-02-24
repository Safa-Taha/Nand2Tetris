// 1:8 Demux
module DEMUX (
    input in,
    input [2:0] sel,
    output reg [7:0] Y
);
    always @(*) begin
        Y = 8'b00000000;
        case (sel)
            3'b000: Y[0] = in;
            3'b001: Y[1] = in;
            3'b010: Y[2] = in;
            3'b011: Y[3] = in;
            3'b100: Y[4] = in;
            3'b101: Y[5] = in;
            3'b110: Y[6] = in;
            3'b111: Y[7] = in;
        endcase
    end
endmodule