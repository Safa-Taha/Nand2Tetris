module ALU_16bit_tb;

reg [15:0] A, B;
reg Cin, Sub;
reg [2:0] ALU_operation;
wire [15:0] Result;
wire Cout, Less;

ALU_16bit uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sub(Sub),
    .ALU_operation(ALU_operation),
    .Result(Result),
    .Cout(Cout),
    .Less(Less)
);

initial begin
    // AND operation
    ALU_operation = 3'b000;
    A = 16'hAAAA;
    B = 16'h5555;
    #10;
    $display("AND: %h & %h = %h", A, B, Result);

    // ADD operation (A + B)
    ALU_operation = 3'b100;
    Sub = 0;
    Cin = 0;
    A = 16'h0001;
    B = 16'h0002;
    #10;
    $display("ADD: %h + %h = %h, Cout=%b", A, B, Result, Cout);

    // SUB operation
    Sub = 1;
    A = 16'h8000; // -32768
    B = 16'h0001; // 1
    #10;
    $display("SUB: %h - %h = %h, Less=%b (signed)", A, B, Result, Less);

    // overflow handling
    A = 16'h7FFF; // 32767
    B = 16'hFFFE; // -2
    #10;
    $display("SUB: %h - %h = %h, Less=%b (overflow case)", A, B, Result, Less);

    $finish;
end

endmodule