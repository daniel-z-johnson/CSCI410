//SimpleFunction.test 2
(SimpleFunction.test)
//push constant 0
@0
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 0
@0
D=A
@SP
M=M+1
A=M-1
M=D

//push local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
M=M+1
A=M-1
M=D
//push local 1
@LCL
D=M
@1
A=D+A
D=M
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

//not
@SP
A=M-1
M=!M
//push argument 0
@ARG
D=M
@0
A=D+A
D=M
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

//push argument 1
@ARG
D=M
@1
A=D+A
D=M
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

//return
//pop argument 0
@ARG
D=M
@0
D=D+A
@SP
M=M-1
A=M+1
M=D
A=A-1
D=M
A=A+1
A=M
M=D
@ARG
D=M+1
@SP
M=D
@LCL
M=M-1
A=M
D=M
@THAT
M=D
@LCL
M=M-1
A=M
D=M
@THIS
M=D
@LCL
M=M-1
A=M
D=M
@ARG
M=D
@LCL
M=M-1
A=M
D=M
@LCL
M=D
M=M+1
@LCL
M=M-1
A=M
0;JMP
