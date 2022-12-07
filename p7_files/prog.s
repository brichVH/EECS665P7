.data
.globl main
gbl_a: .quad 0
gbl_b: .quad 0
gbl_c: .quad 0
.align 8
.text
gbl_print: #Prologue
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
#            [tmp0] := [a] ADD64 1
movq -24(%rbp), %rax
movq $1, %rbx
addq %rbx, %rax
movq %rax, -32(%rbp)
#            setret [tmp0]
movq -32(%rbp), %rax
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
subq $32, %rsp
#Fn body main
#            [funct] := [print]
movq $gbl_print, %rax
movq %rax, -32(%rbp)
#            setarg 1 1
movq $1, %rdi
#            call funct
movq -32(%rbp), %rax
callq *%rax
#            getret [tmp0]
movq %rax, -40(%rbp)
#            [b] := [tmp0]
movq -40(%rbp), %rax
movq %rax, -24(%rbp)
#            REPORT [b]
movq -24(%rbp), %rdi
callq printInt
#Fn epilogue main
lbl_1: addq $32, %rsp
popq %rbp
retq

