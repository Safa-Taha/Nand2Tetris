// 4-way 16-bit Demux
module DEMUX4_16bit (
    input [15:0] in,
    input [1:0] sel,
    output reg [15:0] Y0,
    output reg [15:0] Y1,
    output reg [15:0] Y2,
    output reg [15:0] Y3
);
    always @(*) begin
        Y0 = 16'b0;
        Y1 = 16'b0;
        Y2 = 16'b0;
        Y3 = 16'b0;
        case (sel)
            2'b00: Y0 = in;
            2'b01: Y1 = in;
            2'b10: Y2 = in;
            2'b11: Y3 = in;
        endcase
    end
endmodule