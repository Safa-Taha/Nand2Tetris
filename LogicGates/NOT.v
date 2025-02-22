module \NOT  (
  input a,
  output b
);
  assign b = ~ (a & a);
endmodule
