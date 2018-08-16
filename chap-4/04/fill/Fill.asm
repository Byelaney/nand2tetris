// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(INFINITELOOP)
@KBD
D = M // D = KBD
@CLEARSIGNAL
D; JEQ // if KBD == 0, jump to signal = 0
@signal
M = 1 // signal = 1

(SIGNALOVER)
@SCREEN
D = M
@i
M = D
// M = 16384 // i = 16384
(LOOP)
D = M // D = i
@24575
D = D - M // D = i - 24575
@INFINITELOOP
D; JGT
@signal
D = M // D = signal
@i
A = M // A = M[A]
M = D // M[i] = signal
@i
M = M + 1 // i = i + 1
@LOOP
0; JMP // goto LOOP

(CLEARSIGNAL)
@signal
M = 0 // signal = 0
@SIGNALOVER
0; JMP // goto SIGNALOVER
