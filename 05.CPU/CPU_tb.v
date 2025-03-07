module CPU_tb;
    reg clk;
    reg reset;
    reg [15:0] inM;
    reg [15:0] instruction;

    wire [15:0] outM;
    wire [14:0] addressM;
    wire writeM;
    wire [14:0] pc;

    CPU uut (
        .clk(clk),
        .reset(reset),
        .inM(inM),
        .instruction(instruction),
        .outM(outM),
        .addressM(addressM),
        .writeM(writeM),
        .pc(pc)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin
        reset = 1;
        #20 reset = 0;

        // Test 1: A-instruction (@0x1234)
        instruction = 16'h1234;
        #10;
        $display("[A-inst] A-reg: %h (Expected: 1234)", uut.Areg.out);

        // Test 2: D = D + 1 (C-instruction)
        instruction = 16'b1110011111010000; // D=D+1
        #10;
        $display("[D+1] D-reg: %h (Expected: 0001)", uut.Dreg.out);

        // Test 3: ADD operation
        instruction = 16'b1111000010010000; // D = D + A
        inM = 16'h0005;
        #10;
        $display("[ADD] D-reg: %h (Expected: 0006)", uut.Dreg.out);

        // Test 4: SUB operation
        instruction = 16'b1111000010110000; // D = D - A
        #10;
        $display("[SUB] D-reg: %h (Expected: 0001)", uut.Dreg.out);

        // Test 5: Jump (JGT)
        instruction = 16'b1110000000000001; // JGT
        #10;
        $display("[JMP] PC: %h (Expected: 1234)", pc);

        $finish;

    end
    
endmodule