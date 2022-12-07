.data
.globl main
gbl_a: .quad 0
gbl_b: .quad 0
gbl_c: .quad 0
.align 8
.text
fun_func: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $16, %rsp
#Fn body func
#            getarg 1 [in]
#            [tmp0] := [in] GTE64 10
movq -32(%rbp), %rax
 movq $10, %rbx
movq $0, %rcx
cmpq %rbx, %rax
setge %cl
movq %rcx, -24(%rbp)
#            setret [tmp0]
movq -24(%rbp), %rax
retq
#            goto lbl_0
jmp lbl_0
#Fn epilogue func
lbl_0: addq $16, %rsp
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
#            setarg 1 [a]
