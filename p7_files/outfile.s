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
#            [b] := 0
 movq $0, %rax
movq %rax, (gbl_b)
#            [tmp0] := [a] AND64 [b]
movq (gbl_a), %rax
movq (gbl_b), %rbx
andq %rax, %rbx
movq %rbx, -24(%rbp)
#            IFZ [tmp0] GOTO lbl_1
ifz -24(%rbp) goto lbl_1
#            REPORT [a]
movq (gbl_a), %rdi
callq printBool
#            goto lbl_2
jmp lbl_2
lbl_1: #lbl_1:      nop
nop
#            REPORT [b]
movq (gbl_b), %rdi
callq printBool
lbl_2: #lbl_2:      nop
nop
#Fn epilogue main
lbl_0: addq $16, %rsp
popq %rbp
retq
