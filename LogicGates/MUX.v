
module MUX (
  input a,
  input b,
  input sel,
  output c
);
  assign c = ((a & ~ sel) | (b & sel));
endmodule
