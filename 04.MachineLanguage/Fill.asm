// File: Fill.asm
// Blackens screen when any key is pressed clears when released

@SCREEN
D=A
@current_pixel     
M=D-1

(MAIN_LOOP)
@KBD
D=M
@BLACKEN
D;JGT              // If key pressed (D > 0), blacken screen
@WHITEN
0;JMP              // Else, whiten screen

(BLACKEN)
@KBD
D=A                // Get end of screen address (24576)
@current_pixel
D=D-M              // D = KBD address - current_pixel
@MAIN_LOOP
D;JEQ              // Exit if screen full

@current_pixel
A=M
M=-1               // Set 16 pixels to black
@current_pixel
M=M+1              // Move to next pixel
@MAIN_LOOP
0;JMP

(WHITEN)
@SCREEN
D=A-1              // Get SCREEN-1 address
@current_pixel
D=D-M              // D = (SCREEN-1) - current_pixel
@MAIN_LOOP
D;JEQ              // Exit if screen cleared

@current_pixel
A=M
M=0                // Set 16 pixels to white
@current_pixel
M=M-1              // Move to previous pixel
@MAIN_LOOP
0;JMP