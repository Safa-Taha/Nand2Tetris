// File: Mult.tst
// Tests multiplication of various values.

load Mult.hack,
output-file Mult.out,
compare-to Mult.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

// Test 0 * 0
set RAM[0] 0, set RAM[1] 0, set RAM[2] -1;
repeat 20 { ticktock; }
output;

// Test 5 * 0
set PC 0, set RAM[0] 5, set RAM[1] 0, set RAM[2] -1;
repeat 100 { ticktock; }
output;

// Test 0 * 7
set PC 0, set RAM[0] 0, set RAM[1] 7, set RAM[2] -1;
repeat 50 { ticktock; }
output;

// Test 3 * 4
set PC 0, set RAM[0] 3, set RAM[1] 4, set RAM[2] -1;
repeat 200 { ticktock; }
output;

// Test 6 * 7
set PC 0, set RAM[0] 6, set RAM[1] 7, set RAM[2] -1;
repeat 300 { ticktock; }
output;