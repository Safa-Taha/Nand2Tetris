module PC_TB;
  reg clk, load, inc, reset;
  reg [15:0] in;
  wire [15:0] out;
  PC uut (.clk(clk), .load(load), .inc(inc), .reset(reset), .in(in), .out(out));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    reset = 1; load = 0; inc = 0; in = 16'hFFFF;
    #10 reset = 0; inc = 1;
    #10 inc = 0; load = 1; in = 16'h1234;
    #10 load = 0; inc = 1;
    #10 reset = 1;
    #10 $finish;
  end

  initial begin
    $monitor("Time=%t, out=%h", $time, out);
  end
endmodule