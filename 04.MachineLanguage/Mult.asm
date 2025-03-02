// File: Mult.asm
// Multiplies R0 and R1 then stores the result in R2.

@product
M=0                // Initialize product to 0
@counter
M=0                // Initialize counter to 0

(LOOP)
@counter
D=M
@R0
D=D-M              // D = counter - R0
@END
D;JEQ              // If counter == R0, exit loop

@R1
D=M
@product
M=D+M              // product += R1

@counter
M=M+1              // counter++
@LOOP
0;JMP

(END)
@product
D=M
@R2
M=D                // Store result in R2

(HALT)
@HALT              // Infinite loop to halt
0;JMP