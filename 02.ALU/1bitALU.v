// 1bitALU.v
// ALU operations:
// AND       |   000
// OR        |   001
// XOR       |   010
// NOR       |   011
// ADD,SUB   |   100    

module ALU_1bit (
    input       A,
    input       B,
    input       Cin,
    input       Sub,
    input [2:0] ALU_operation,
    output      Result,
    output      Cout,
    output      Less
);
    // Logical operations
    wire and_res = A & B;
    wire or_res  = A | B;
    wire xor_res = A ^ B;
    wire nor_res = ~(A | B);
    wire B_adder = B ^ Sub;
    wire Cin_adder = Sub ? 1'b1 : Cin;
    wire sum = A ^ B_adder ^ Cin_adder;
    wire arith_cout = (A & B_adder) | (A & Cin_adder) | (B_adder & Cin_adder);

    // Result multiplexer
    assign Result = (ALU_operation == 3'b000) ? and_res :
                    (ALU_operation == 3'b001) ? or_res  :
                    (ALU_operation == 3'b010) ? xor_res :
                    (ALU_operation == 3'b011) ? nor_res :
                    (ALU_operation == 3'b100) ? sum   : 1'b0;

    assign Cout = (ALU_operation == 3'b100) ? arith_cout : 1'b0;
    assign Less = (ALU_operation == 3'b100 && Sub) ? sum : 1'b0;

endmodule
