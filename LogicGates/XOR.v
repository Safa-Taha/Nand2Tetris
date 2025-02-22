
module \XOR  (
  input a,
  input b,
  output c
);
  assign c = ~ (~ (a & ~ (a & b)) & ~ (~ (a & b) & b));
endmodule
