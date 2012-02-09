// This file is part of the materials accompanying the book 
// "The Elements of Computing Systems" by Nisan and Schocken, 
// MIT Press. Book site: www.idc.ac.il/tecs
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Put your code here.

//@16384
//D=A
//M=-1
//(LOOP)
//	@1
//	D=D+A
//	A=D
//	M=-1
//	@LOOP
//	0;JMP
//test above,got plenty of sleep but still sleepy
@16384
D=A
//24575 last pixal
(BLACK)
	@16384
	M=-1
	D=A
	@0
	M=D
(POKEMONBLACK)
	@0
	D=M
	@1
	AD=D+A
	M=-1
	@0
	M=D
	@24575
	D=D-A
	@OVER1
	D;JLT
	@BLACK
	0;JMP
	(OVER1)
	@24576
	D=M
	@POKEMONBLACK
	D;JNE
	@WHITE
	0;JMP

(WHITE)
	@16384
	M=0
	D=A
	@0
	M=D
(POKEMONWHITE)
	@0
	D=M
	@1
	AD=D+A
	M=0
	@0
	M=D
	@24575
	D=D-A
	@OVER2
	D;JLT
	@WHITE
	0;JMP
	(OVER2)
	@24576
	D=M
	@POKEMONWHITE
	D;JEQ
	@BLACK
	0;JMP
