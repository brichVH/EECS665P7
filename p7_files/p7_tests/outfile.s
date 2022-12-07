.data
.globl main
gbl_a: .quad 0
gbl_b: .quad 0
.align 8
.text
main: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $16, %rsp
#Fn body main
#            [a] := 1
 movq $1, %rax
movq %rax, (gbl_a)
#            [b] := 2
 movq $2, %rax
movq %rax, (gbl_b)
#            REPORT [a]
movq (gbl_a), %rdi
callq printInt
#            [tmp0] := [a] ADD64 [b]
movq (gbl_a), %rax
movq (gbl_b), %rbx
addq %rax, %rbx
movq %rbx, -24(%rbp)
#            [b] := [tmp0]
movq -24(%rbp), %rax
movq %rax, (gbl_b)
#            REPORT [b]
movq (gbl_b), %rdi
callq printInt
#Fn epilogue main
lbl_0: addq $16, %rsp
popq %rbp
retq
