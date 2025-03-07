// CPU.v
// 16-bit Hack CPU
module CPU(
    input         clk,
    input         reset,
    input  [15:0] inM,        
    input  [15:0] instruction, 
    output [15:0] outM,     
    output [14:0] addressM,
    output        writeM,      
    output [14:0] pc 
);

    // internal wires
    wire is_c_instruction = instruction[15];
    wire [2:0] ALU_operation = instruction[11:9];
    wire       Sub = instruction[8];
    wire [15:0] Ain = is_c_instruction ? ALUout : instruction;   // A-register input
    wire loadA = (~is_c_instruction) | (is_c_instruction & instruction[5]);    // A-register load

    ARegister Areg (
        .clk(clk),
        .reset(reset),
        .in(Ain),
        .load(loadA),
        .out(Aout)
    );

    // D-register
    wire loadD = is_c_instruction & instruction[4];
    DRegister Dreg (
        .clk(clk),
        .reset(reset),
        .in(ALUout),
        .load(loadD),
        .out(Dout)
    );

    // ALU input selection
    wire [15:0] AMout = instruction[12] ? inM : Aout;

    // ALU instance
    ALU_16bit alu (
        .A(Dout),
        .B(AMout),
        .ALU_operation(ALU_operation),
        .Sub(Sub),
        .Result(ALUout),
        .Cout(),
        .Zero(zero),
        .Negative(negative),
        .Less(less)
    );

    // Jump logic
    wire jlt = instruction[2] & negative;
    wire jeq = instruction[1] & zero;
    wire jgt = instruction[0] & (~negative) & (~zero);
    wire jmp = is_c_instruction & (jlt | jeq | jgt);

    // Program Counter
    PC pc_unit (
        .clk(clk),
        .reset(reset),
        .load(jmp),
        .inc(1'b1),
        .in(Aout[14:0]),
        .out(pc)
    );

    // Memory outputs
    assign outM    = ALUout;
    assign addressM = Aout[14:0];
    assign writeM  = is_c_instruction & instruction[3];

    // Internal wires for A, D and ALU result.
    wire [15:0] Aout, Dout, ALUout;
    wire zero, negative, less;

endmodule
