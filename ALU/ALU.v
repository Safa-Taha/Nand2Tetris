module alu(
    input  [15:0] A,
    input  [15:0] B,
    input  [2:0]  control,
    output [15:0] result,
    output Z, N, V, C
);

    // Internal wires
    wire [15:0] a_and_b;
    wire [15:0] a_or_b;
    wire [15:0] not_b;
    wire [15:0] mux_1;
    wire [15:0] sum;
    wire [15:0] slt;
    wire cout;
    wire [15:0] mux_2;

    // Logic for AND, OR, and NOT
    assign a_and_b = A & B;
    assign a_or_b = A | B;
    assign not_b = ~B;

    // MUX for B or NOT B (used in subtraction)
    assign mux_1 = (control[0]) ? not_b : B;

    // Adder/Subtractor
    assign {cout, sum} = A + mux_1 + control[0];

    // SLT (Set Less Than)
    assign slt = (A[15] == B[15]) ? (sum[15] ? 16'h0001 : 16'h0000) : (A[15] ? 16'h0001 : 16'h0000);

    // MUX for operation selection
    assign mux_2 = (control == 3'b000) ? sum :   // ADD
                      (control == 3'b001) ? sum :   // SUB
                      (control == 3'b010) ? a_and_b : // AND
                      (control == 3'b011) ? a_or_b :  // OR
                      (control == 3'b100) ? slt :     // SLT
                      16'h0000;

    assign result = mux_2;

    // Flags
    assign Z = (result == 16'h0000);         // Zero flag
    assign N = result[15];                   // Negative flag
    assign C = ((control == 3'b000) || (control == 3'b001)) ? (control[0] ? ~cout : cout) : 1'b0;       // Carry flag
    assign V = ((control == 3'b000) || (control == 3'b001)) ? 
               ((A[15] == mux_1[15]) & (A[15] != sum[15])) : 1'b0;      // Overflow flag

endmodule