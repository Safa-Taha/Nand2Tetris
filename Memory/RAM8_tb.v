module RAM8_TB;
  reg clk, load;
  reg [2:0] address;
  reg [15:0] in;
  wire [15:0] out;
  RAM8 uut (.clk(clk), .load(load), .address(address), .in(in), .out(out));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    load = 1; address = 3'b000; in = 16'h1234;
    #10;
    load = 0; address = 3'b001;
    #10;
    load = 1; address = 3'b001; in = 16'h5678;
    #10;
    load = 0; address = 3'b000;
    #10;
    $finish;
  end

  initial begin
    $monitor("Time=%t, address=%d, out=%h", $time, address, out);
  end
endmodule