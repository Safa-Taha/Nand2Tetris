// 16bitALU.v

module ALU_16bit (
    input  [15:0] A,
    input  [15:0] B,
    input  [2:0]  ALU_operation,
    input         Sub, 
    output [15:0] Result,
    output        Cout,
    output        Zero,
    output        Negative,
    output        Less
);
    wire [15:0] carry;
    wire overflow;

    // Adjust B based on Sub flag.
    wire [15:0] B_adj = Sub ? ~B : B;
    wire        Cin   = Sub ? 1'b1 : 1'b0;


    // First bit ALU (bit 0)
    wire dummy_less;
    ALU_1bit alu0 (
        .A(A[0]),
        .B(B_adj[0]),
        .Cin(Cin),
        .Sub(Sub),
        .ALU_operation(ALU_operation),
        .Result(Result[0]),
        .Cout(carry[0]),
        .Less(dummy_less)
    );

    // Generate remaining bits.
    genvar i;
    generate
        for(i = 1; i < 16; i = i + 1) begin : alu_chain
            ALU_1bit alu (
                .A(A[i]),
                .B(B_adj[i]),
                .Cin(carry[i-1]),
                .Sub(Sub),
                .ALU_operation(ALU_operation),
                .Result(Result[i]),
                .Cout(carry[i]),
                .Less(1'b0)
            );
        end
    endgenerate

    // Arithmetic status flags.
    assign overflow = carry[14] ^ carry[15];
    assign Cout     = carry[15];
    assign Zero     = (Result == 16'b0);
    assign Negative = Result[15];

    // For comparisons: when doing subtraction (ALU_operation == 100 and Sub==1)
    assign Less = ((ALU_operation == 3'b100) && Sub) ? (Result[15] ^ overflow) : 1'b0;

endmodule
