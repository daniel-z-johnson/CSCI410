//push constant 17
@17
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 17
@17
D=A
@SP
M=M+1
A=M-1
M=D

//eq
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@equal0
D;JEQ
D=0
@end0
0;JMP
(equal0)
D=-1
(end0)
@SP
A=M-1
M=D

//push constant 892
@892
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 891
@891
D=A
@SP
M=M+1
A=M-1
M=D

//lt
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@less1
D;JGT
D=0
@end1
0;JMP
(less1)
D=-1
(end1)
@SP
A=M-1
M=D

//push constant 32767
@32767
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 32766
@32766
D=A
@SP
M=M+1
A=M-1
M=D

//gt
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@greater2
D;JLT
D=0
@end2
0;JMP
(greater2)
D=-1
(end2)
@SP
A=M-1
M=D

//push constant 56
@56
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 31
@31
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 53
@53
D=A
@SP
M=M+1
A=M-1
M=D

//add
@SP
M=M-1
A=M
D=M
A=A-1
M=D+M

//push constant 112
@112
D=A
@SP
M=M+1
A=M-1
M=D

//sub
@SP
M=M-1
A=M
D=M
A=A-1
M=M-D

//neg
@SP
A=M-1
M=-M
//and
@SP
M=M-1
A=M
D=M
A=A-1
M=D&M
//push constant 82
@82
D=A
@SP
M=M+1
A=M-1
M=D

//or
@SP
M=M-1
A=M
D=M
A=A-1
M=D|M
