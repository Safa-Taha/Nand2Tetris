// File: Fill.tst
// Tests screen filling/clearing with keyboard input.

load Fill.hack,
output;

echo "Press any key... (Testing Blacken)";
set RAM[24576] 65,  // Simulate key press
repeat 2000 {
    ticktock;
}
echo "Check screen is blackened...";

echo "Release key... (Testing Whiten)";
set RAM[24576] 0,   // Simulate key release
repeat 2000 {
    ticktock;
}
echo "Check screen is cleared...";