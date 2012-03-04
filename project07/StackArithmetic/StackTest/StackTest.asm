@17
D=A
@SP
M=M+1
A=M-1
M=D

@17
D=A
@SP
M=M+1
A=M-1
M=D

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

@892
D=A
@SP
M=M+1
A=M-1
M=D

@891
D=A
@SP
M=M+1
A=M-1
M=D

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

@32767
D=A
@SP
M=M+1
A=M-1
M=D

@32766
D=A
@SP
M=M+1
A=M-1
M=D

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

@56
D=A
@SP
M=M+1
A=M-1
M=D

@31
D=A
@SP
M=M+1
A=M-1
M=D

@53
D=A
@SP
M=M+1
A=M-1
M=D

@SP
M=M-1
A=M
D=M
A=A-1
M=D+M

@112
D=A
@SP
M=M+1
A=M-1
M=D

@SP
M=M-1
A=M
D=M
A=A-1
M=M-D

@SP
A=M-1
M=-M
@SP
M=M-1
A=M
D=M
A=A-1
M=D&M
@82
D=A
@SP
M=M+1
A=M-1
M=D

@SP
M=M-1
A=M
D=M
A=A-1
M=D|M
