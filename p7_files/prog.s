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
