module DFF_TB;
  reg clk, d;
  wire q;
  DFF uut (.clk(clk), .d(d), .q(q));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    d = 0;
    #10 d = 1;
    #10 d = 0;
    #10 $finish;
  end

  initial begin
    $monitor("Time=%t, d=%b, q=%b", $time, d, q);
  end
endmodule