.data
.globl main
gbl_a: .quad 0
gbl_b: .quad 0
gbl_c: .quad 0
str_6: .asciz "\n"
str_5: .asciz "\n"
str_4: .asciz "\n"
str_3: .asciz "\n"
str_2: .asciz "\n"
str_1: .asciz "\n"
str_0: .asciz "\n"
.align 8
.text
fun_func: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $64, %rsp
movq %rdi, -24(%rbp)
movq %rsi, -32(%rbp)
movq %rdx, -40(%rbp)
movq %rcx, -48(%rbp)
movq %r8, -56(%rbp)
movq %r9, -64(%rbp)
#Fn body func
#            getarg 1 [in1]
#            getarg 2 [in2]
#            getarg 3 [in3]
#            getarg 4 [in4]
#            getarg 5 [in5]
#            getarg 6 [in6]
#            REPORT [in1]
movq -24(%rbp), %rdi
callq printInt
#            REPORT str_0
movq $str_0, %rdi
callq printString
#            REPORT [in2]
movq -32(%rbp), %rdi
callq printInt
#            REPORT str_1
movq $str_1, %rdi
callq printString
#            REPORT [in3]
movq -40(%rbp), %rdi
callq printInt
#            REPORT str_2
movq $str_2, %rdi
callq printString
#            REPORT [in4]
movq -48(%rbp), %rdi
callq printInt
#            REPORT str_3
movq $str_3, %rdi
callq printString
#            REPORT [in5]
movq -56(%rbp), %rdi
callq printInt
#            REPORT str_4
movq $str_4, %rdi
callq printString
#            REPORT [in6]
movq -64(%rbp), %rdi
callq printInt
#            REPORT str_5
movq $str_5, %rdi
callq printString
#            [tmp0] := [in1] GTE64 10
movq -24(%rbp), %rax
movq $10, %rbx
movq $0, %rcx
cmpq %rbx, %rax
setge %cl
movq %rcx, -72(%rbp)
#            setret [tmp0]
movq -72(%rbp),  %rax
#            goto lbl_0
jmp lbl_0
#            REPORT str_6
movq $str_6, %rdi
callq printString
#Fn epilogue func
lbl_0: addq $64, %rsp
popq %rbp
retq

main: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $16, %rsp
#Fn body main
#            [a] := 20
movq $20, %rax
movq %rax, (gbl_a)
#            [tmp0] := NEG64 1
movq $1, %rax
negq %rax 
movq %rax, -24(%rbp)
#            [b] := [tmp0]
movq -24(%rbp), %rax
movq %rax, (gbl_b)
#            setarg 1 1
movq $1, %rdi
#            setarg 2 2
movq $2, %rsi
#            setarg 3 3
movq $3, %rdx
#            setarg 4 4
movq $4, %rcx
#            setarg 5 5
movq $5, %r8
#            setarg 6 6
movq $6, %r9
#            call func
callq fun_func
#            getret [tmp1]
movq %rax, -32(%rbp)
#            REPORT [tmp1]
movq -32(%rbp), %rdi
callq printBool
#Fn epilogue main
lbl_1: addq $16, %rsp
popq %rbp
retq

