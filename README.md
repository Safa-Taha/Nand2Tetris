# Nand2Tetris Verilog Implementation

My attempt at a Verilog-based hardware implementation of the Nand2Tetris 16-bit Hack CPU project, starting from basic digital components building up to the final CPU.

## 📐 Architecture Overview
  - A 16-bit ALU design supporting 3-bit Operation Code Decoding (000-100), implementing AND, OR, XOR, NOR, and ADD/SUB logic. This ALU is built as a chain of 16 one-bit ALU modules: ![1bit ALU circuit](<02.ALU/1-bit ALU.png>)

  | ALU Operation | OpCode |
  |---------------|--------|
  | AND           | 000    |
  | OR            | 001    |
  | XOR           | 010    |
  | NOR           | 011    |
  | ADD / SUB     | 100    |
  
  Making the final ALU circuit module: ![16bit ALU circuit](<02.ALU/16bitALU.png>)
  - Top-level CPU integrating the ALU module, A and D registers, and a Program Counter, Overall roughly having the following architectural diagram:  ![CPU diagram](05.CPU/CPU.png)
