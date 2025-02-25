`timescale 1ns / 1ps

module FullAdder_tb;

  // Inputs
  reg A;
  reg B;
  reg C;

  // Outputs
  wire sum;
  wire carry;

  // Unit Under Test (UUT)
  FullAdder uut (
    .A(A),
    .B(B),
    .C(C),
    .sum(sum),
    .carry(carry)
  );


  initial begin
    $monitor("Time = %0t | A = %b | B = %b | C = %b | Sum = %b | Carry = %b", 
             $time, A, B, C, sum, carry);

    A = 0; B = 0; C = 0; #10; 
    A = 0; B = 0; C = 1; #10;
    A = 0; B = 1; C = 0; #10;
    A = 0; B = 1; C = 1; #10;
    A = 1; B = 0; C = 0; #10;
    A = 1; B = 0; C = 1; #10;
    A = 1; B = 1; C = 0; #10;
    A = 1; B = 1; C = 1; #10;

    $stop;
  end

endmodule