.data
.globl main
gbl_a: .quad 0
gbl_b: .quad 0
gbl_c: .quad 0
gbl_print: .quad 0
gbl_main: .quad 0
.align 8
.text
fun_print: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $16, %rsp
movq %rdi, -24(%rbp)
#Fn body print
#            getarg 1 [a]
#            REPORT [a]
movq -24(%rbp), %rdi
callq printInt
#            setret 1
movq $1, %rax
#            goto lbl_0
jmp lbl_0
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
#Fn epilogue main
lbl_1: addq $0, %rsp
popq %rbp
retq

