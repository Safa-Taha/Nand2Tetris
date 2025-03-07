# Nand2Tetris Verilog Implementation

My attempt at a Verilog-based implementation of the Nand2Tetris 16-bit Hack CPU project.
ALU 
- **CPU Architecture:** Includes A and D registers, ALU, PC, and memory interfaces to run Hack assembly code.

Propagates carry signal for 16-bit chaining

## 📐 Architecture Overview
  - 16-bit ALU that supports 3-bit Operation Code Decoding (000-100), implementing AND, OR, XOR, NOR, and ADD/SUB. The ALU is built as a chain of 16 one-bit ALU modules: ![1bit ALU circuit](<02.ALU/1-bit ALU.png>)

  | ALU Operation | OpCode |
  |---------------|--------|
  | AND           | 000    |
  | OR            | 001    |
  | XOR           | 010    |
  | NOR           | 011    |
  | ADD / SUB     | 100    |
  
  Making the final ALU circuit module: ![16bit ALU circuit](<02.ALU/16bitALU.png>)
  - Top-level CPU integrates the ALU module, A and D registers, and a Program Counter, Overall having the following architectural diagram:  ![CPU diagram](<05.CPU\CPU.png>)