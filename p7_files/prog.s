.data
.globl main
gbl_a: .quad 0
gbl_b: .quad 0
str_6: .asciz "\n"
str_5: .asciz "\n"
str_4: .asciz "\n"
str_3: .asciz "Hi there\n"
str_2: .asciz "\n"
str_1: .asciz "\n"
str_0: .asciz "\n"
.align 8
.text
fun_print: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $48, %rsp
movq %rdi, -24(%rbp)
movq %rsi, -32(%rbp)
movq %rdx, -40(%rbp)
movq %rcx, -48(%rbp)
movq %r8, -56(%rbp)
movq %r9, -64(%rbp)
#Fn body print
#            getarg 1 [a]
#            getarg 2 [b]
#            getarg 3 [c]
#            getarg 4 [d]
#            getarg 5 [e]
#            getarg 6 [f]
#            REPORT [a]
movq -24(%rbp), %rdi
callq printInt
#            REPORT [b]
movq -32(%rbp), %rdi
callq printBool
#            REPORT [c]
movq -40(%rbp), %rdi
callq printInt
#            REPORT [d]
movq -48(%rbp), %rdi
callq printInt
#            REPORT [e]
movq -56(%rbp), %rdi
callq printInt
#            REPORT [f]
movq -64(%rbp), %rdi
callq printInt
#            REPORT str_0
movq $str_0, %rdi
callq printString
#            setret [b]
movq -32(%rbp),  %rax
#            goto lbl_0
jmp lbl_0
#Fn epilogue print
lbl_0: addq $48, %rsp
popq %rbp
retq

main: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $32, %rsp
#Fn body main
#            [a] := 1
movq $1, %rax
movq %rax, (gbl_a)
#            [b] := 1
movq $1, %rax
movq %rax, (gbl_b)
#            REPORT [a]
movq (gbl_a), %rdi
callq printInt
#            REPORT str_1
movq $str_1, %rdi
callq printString
#            REPORT [b]
movq (gbl_b), %rdi
callq printBool
#            REPORT str_2
movq $str_2, %rdi
callq printString
#            REPORT str_3
movq $str_3, %rdi
callq printString
#            setarg 1 33
movq $33, %rdi
#            setarg 2 0
movq $0, %rsi
#            setarg 3 1
movq $1, %rdx
#            setarg 4 2
movq $2, %rcx
#            setarg 5 3
movq $3, %r8
#            setarg 6 4
movq $4, %r9
#            call print
callq fun_print
#            getret [tmp0]
movq %rax, -24(%rbp)
#            [b] := [tmp0]
movq -24(%rbp), %rax
movq %rax, (gbl_b)
#            REPORT str_4
movq $str_4, %rdi
callq printString
#            REPORT [b]
movq (gbl_b), %rdi
callq printBool
#            RECEIVE [in]
movq -40(%rbp), %rdi
callq getBool
movq %rax, -40(%rbp)
#            REPORT [in]
movq -40(%rbp), %rdi
callq printBool
#            REPORT str_5
movq $str_5, %rdi
callq printString
#            MAYHEM [tmp1]
callq mayhem
movq %rax, -32(%rbp)
#            [may] := [tmp1]
movq -32(%rbp), %rax
movq %rax, -48(%rbp)
#            REPORT [may]
movq -48(%rbp), %rdi
callq printInt
#            REPORT str_6
movq $str_6, %rdi
callq printString
#Fn epilogue main
lbl_1: addq $32, %rsp
popq %rbp
retq

