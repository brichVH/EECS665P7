.data
.globl main
gbl_a: .quad 0
gbl_b: .quad 0
str_4: .asciz "Hi there\n"
str_3: .asciz "\n"
str_2: .asciz "\n"
str_1: .asciz "\n"
str_0: .asciz "\n"
.align 8
.text
fun_print: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $16, %rsp
#Fn body print
#            getarg 1 [a]
#            getarg 2 [b]
#            REPORT [a]
movq -24(%rbp), %rdi
callq printInt
#            REPORT str_0
movq $str_0, %rdi
callq printString
#            REPORT [b]
movq -32(%rbp), %rdi
callq printBool
#            REPORT str_1
movq $str_1, %rdi
callq printString
#Fn epilogue print
lbl_0: addq $16, %rsp
popq %rbp
retq
main: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $0, %rsp
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
#            REPORT str_2
movq $str_2, %rdi
callq printString
#            REPORT [b]
movq (gbl_b), %rdi
callq printBool
#            REPORT str_3
movq $str_3, %rdi
callq printString
#            REPORT str_4
movq $str_4, %rdi
callq printString
#            setarg 1 [a]
