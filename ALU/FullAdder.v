module FullAdder (
  input A,
  input B,
  input C,
  output sum,
  output carry
);
  wire s0;
  assign s0 = (A ^ B);
  assign sum = (s0 ^ C);
  assign carry = ((C & s0) | (A & B));
endmodule
