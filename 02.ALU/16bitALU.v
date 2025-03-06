// 16-bit ALU
module ALU_16bit (
    input [15:0] A,
    input [15:0] B,
    input Cin,
    input Sub,
    input [2:0] ALU_operation,
    output [15:0] Result,
    output Cout,
    output Less
);

// Internal wires
wire [15:0] carry;
wire [15:0] less;
wire overflow;

genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin : alu_chain
        if (i == 0) begin
            ALU_1bit alu (
                .A(A[i]),
                .B(B[i]),
                .Cin(Cin),
                .Sub(Sub),
                .ALU_operation(ALU_operation),
                .Result(Result[i]),
                .Cout(carry[i]),
                .Less(less[i])
            );
        end else begin
            ALU_1bit alu (
                .A(A[i]),
                .B(B[i]),
                .Cin(carry[i-1]),
                .Sub(Sub),
                .ALU_operation(ALU_operation),
                .Result(Result[i]),
                .Cout(carry[i]),
                .Less(less[i])
            );
        end
    end
endgenerate

assign Cout = carry[15];
assign overflow = carry[14] ^ carry[15];
assign Less = (ALU_operation == 3'b100 && Sub) ? (overflow ^ less[15]) : 1'b0;

endmodule