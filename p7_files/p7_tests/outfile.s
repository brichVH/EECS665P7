.data
.globl main
str_5: .asciz "\n"
str_4: .asciz "\nfn ptrs:"
str_3: .asciz "\nshould be false: "
str_2: .asciz "\nshould be true: "
str_1: .asciz "\nshould be false: "
str_0: .asciz "\nshould be true: "
.align 8
.text
callq main
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
subq $80, %rsp
#Fn body main
#            [a] := 5
movq $5, %rax
movq %rax, -32(%rbp)
#            [b] := 6
movq $6, %rax
movq %rax, -24(%rbp)
#            REPORT str_0
movq $str_0, %rdi
callq printString
#            [tmp0] := [a] LT64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rcx
cmpq %rbx, %rax
setl %cl
movq %rcx, -56(%rbp)
#            [c] := [tmp0]
movq -56(%rbp), %rax
movq %rax, -40(%rbp)
#            REPORT [c]
movq -40(%rbp), %rdi
callq printBool
#            REPORT str_1
movq $str_1, %rdi
callq printString
#            [tmp1] := [a] GT64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rcx
cmpq %rbx, %rax
setg %cl
movq %rcx, -64(%rbp)
#            [c] := [tmp1]
movq -64(%rbp), %rax
movq %rax, -40(%rbp)
#            REPORT [c]
movq -40(%rbp), %rdi
callq printBool
#            REPORT str_2
movq $str_2, %rdi
callq printString
#            [tmp2] := [a] LTE64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rcx
cmpq %rbx, %rax
setle %cl
movq %rcx, -72(%rbp)
#            [c] := [tmp2]
movq -72(%rbp), %rax
movq %rax, -40(%rbp)
#            REPORT [c]
movq -40(%rbp), %rdi
callq printBool
#            REPORT str_3
movq $str_3, %rdi
callq printString
#            [tmp3] := [a] GTE64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rcx
cmpq %rbx, %rax
setge %cl
movq %rcx, -80(%rbp)
#            [c] := [tmp3]
movq -80(%rbp), %rax
movq %rax, -40(%rbp)
#            REPORT [c]
movq -40(%rbp), %rdi
callq printBool
#            REPORT str_4
movq $str_4, %rdi
callq printString
#            [funct] := [print]
movq $gbl_print, %rax
movq %rax, -48(%rbp)
#            setarg 1 1
movq $1, %rdi
#            call funct
movq -48(%rbp), %rax
callq *%rax
#            getret [tmp4]
movq %rax, -88(%rbp)
#            [b] := [tmp4]
movq -88(%rbp), %rax
movq %rax, -24(%rbp)
#            REPORT [b]
movq -24(%rbp), %rdi
callq printInt
#            REPORT str_5
movq $str_5, %rdi
callq printString
#Fn epilogue main
lbl_1: addq $80, %rsp
popq %rbp
retq

