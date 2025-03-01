module Mux8Way16_TB;
  reg [15:0] a,b,c,d,e,f,g,h;
  reg [2:0] sel;
  wire [15:0] out;
  Mux8Way16 uut (.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h), .sel(sel), .out(out));

  initial begin
    a=16'h0001; b=16'h0002; c=16'h0003; d=16'h0004;
    e=16'h0005; f=16'h0006; g=16'h0007; h=16'h0008;
    sel=0;
    #10 sel=1;
    #10 sel=2;
    #10 sel=3;
    #10 sel=4;
    #10 sel=5;
    #10 sel=6;
    #10 sel=7;
    #10 $finish;
  end

  initial begin
    $monitor("Time=%t, sel=%d, out=%h", $time, sel, out);
  end
endmodule