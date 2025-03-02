
module DMUX (
  input \input ,
  input sel,
  output a,
  output b
);
  assign b = (sel & \input );
  assign a = (~ sel & \input );
endmodule
