`timescale 1ns / 1ps

module HalfAdder_tb;

  // Inputs
  reg A;
  reg B;

  // Outputs
  wire sum;
  wire carry;

  // Unit Under Test (UUT)
  HalfAdder uut (
    .A(A),
    .B(B),
    .sum(sum),
    .carry(carry)
  );

  // Testbench logic
  initial begin
    $monitor("Time = %0t | A = %b | B = %b | Sum = %b | Carry = %b", 
             $time, A, B, sum, carry);

    // input combinations
    A = 0; B = 0; #10; 
    A = 0; B = 1; #10; 
    A = 1; B = 0; #10; 
    A = 1; B = 1; #10; 

    $stop;
  end

endmodule