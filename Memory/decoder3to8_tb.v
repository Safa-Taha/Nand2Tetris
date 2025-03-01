module decoder3to8_TB;
  reg [2:0] sel;
  wire [7:0] out;
  decoder3to8 uut (.sel(sel), .out(out));

  initial begin
    sel = 0;
    #10 sel = 1;
    #10 sel = 2;
    #10 sel = 3;
    #10 sel = 4;
    #10 sel = 5;
    #10 sel = 6;
    #10 sel = 7;
    #10 $finish;
  end

  initial begin
    $monitor("Time=%t, sel=%d, out=%b", $time, sel, out);
  end
endmodule