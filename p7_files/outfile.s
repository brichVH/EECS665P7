.data
.globl main
gbl_a: .quad 0
gbl_b: .quad 0
gbl_d: .quad 0
gbl_e: .quad 0
gbl_c: .quad 0
str_0: .asciz "\n"
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
#            [tmp0] := [a] LT64 [b]
movq (gbl_a), %rax
movq (gbl_b), %rbx
cmpq %rax, %rbx
setne %bl
andq $0x1, %rbx
movq %rbx, -24(%rbp)
#            [c] := [tmp0]
movq -24(%rbp), %rax
movq %rax, (gbl_c)
#            REPORT [c]
movq (gbl_c), %rdi
callq printBool
#            [tmp1] := [a] GT64 [b]
movq (gbl_a), %rax
movq (gbl_b), %rbx
cmpq %rax, %rbx
setg %bl
andq $0x1, %rbx
movq %rbx, -32(%rbp)
#            [c] := [tmp1]
movq -32(%rbp), %rax
movq %rax, (gbl_c)
#            REPORT [c]
movq (gbl_c), %rdi
callq printBool
#            REPORT str_0
 movq $str_0, %rdi
callq printString
#Fn epilogue main
lbl_0: addq $16, %rsp
popq %rbp
retq
