.data
.globl main
str_17: .asciz "\n"
str_0: .asciz "DONE WITH 665!!!\n"
str_12: .asciz "\n"
str_2: .asciz "\nshould be false: "
str_14: .asciz "\n"
str_3: .asciz "\nshould be true: "
str_4: .asciz "\nshould be false: "
str_5: .asciz "\nshould be 30: "
str_16: .asciz "\n"
str_6: .asciz "\nshould be 5: "
str_7: .asciz "\nshould be 11: "
str_13: .asciz "\n"
str_8: .asciz "\nshould be -1: "
str_15: .asciz "not equals"
str_9: .asciz "\nshould be 10: "
str_1: .asciz "\nshould be true: "
str_10: .asciz "\nshould be -10: "
str_11: .asciz "\nfn ptrs: (12)"
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

gbl_donewith665: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $16, %rsp
movq %rdi, -24(%rbp)
#Fn body donewith665
#            getarg 1 [z]
#            REPORT str_0
movq $str_0, %rdi
callq printString
#Fn epilogue donewith665
lbl_1: addq $16, %rsp
popq %rbp
retq

main: #Prologue
pushq %rbp
movq %rsp, %rbp
addq $16, %rbp
subq $176, %rsp
#Fn body main
#            [a] := 5
movq $5, %rax
movq %rax, -32(%rbp)
#            [b] := 6
movq $6, %rax
movq %rax, -24(%rbp)
#            REPORT str_1
movq $str_1, %rdi
callq printString
#            [tmp0] := [a] LT64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rcx
cmpq %rbx, %rax
setl %cl
movq %rcx, -72(%rbp)
#            [c] := [tmp0]
movq -72(%rbp), %rax
movq %rax, -40(%rbp)
#            REPORT [c]
movq -40(%rbp), %rdi
callq printBool
#            REPORT str_2
movq $str_2, %rdi
callq printString
#            [tmp1] := [a] GT64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rcx
cmpq %rbx, %rax
setg %cl
movq %rcx, -80(%rbp)
#            [c] := [tmp1]
movq -80(%rbp), %rax
movq %rax, -40(%rbp)
#            REPORT [c]
movq -40(%rbp), %rdi
callq printBool
#            REPORT str_3
movq $str_3, %rdi
callq printString
#            [tmp2] := [a] LTE64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rcx
cmpq %rbx, %rax
setle %cl
movq %rcx, -88(%rbp)
#            [c] := [tmp2]
movq -88(%rbp), %rax
movq %rax, -40(%rbp)
#            REPORT [c]
movq -40(%rbp), %rdi
callq printBool
#            REPORT str_4
movq $str_4, %rdi
callq printString
#            [tmp3] := [a] GTE64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rcx
cmpq %rbx, %rax
setge %cl
movq %rcx, -96(%rbp)
#            [c] := [tmp3]
movq -96(%rbp), %rax
movq %rax, -40(%rbp)
#            REPORT [c]
movq -40(%rbp), %rdi
callq printBool
#            REPORT str_5
movq $str_5, %rdi
callq printString
#            [tmp4] := [a] MULT64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
imul %rbx, %rax
movq %rax, -104(%rbp)
#            [d] := [tmp4]
movq -104(%rbp), %rax
movq %rax, -48(%rbp)
#            REPORT [d]
movq -48(%rbp), %rdi
callq printInt
#            REPORT str_6
movq $str_6, %rdi
callq printString
#            [tmp5] := [d] DIV64 [b]
movq -48(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rdx
idivq %rbx
movq %rax, -112(%rbp)
#            [d] := [tmp5]
movq -112(%rbp), %rax
movq %rax, -48(%rbp)
#            REPORT [d]
movq -48(%rbp), %rdi
callq printInt
#            REPORT str_7
movq $str_7, %rdi
callq printString
#            [tmp6] := [a] ADD64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
addq %rbx, %rax
movq %rax, -120(%rbp)
#            [d] := [tmp6]
movq -120(%rbp), %rax
movq %rax, -48(%rbp)
#            REPORT [d]
movq -48(%rbp), %rdi
callq printInt
#            REPORT str_8
movq $str_8, %rdi
callq printString
#            [tmp7] := [a] SUB64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
subq %rbx, %rax
movq %rax, -128(%rbp)
#            [d] := [tmp7]
movq -128(%rbp), %rax
movq %rax, -48(%rbp)
#            REPORT [d]
movq -48(%rbp), %rdi
callq printInt
#            REPORT str_9
movq $str_9, %rdi
callq printString
#            [tmp8] := [a] ADD64 5
movq -32(%rbp), %rax
movq $5, %rbx
addq %rbx, %rax
movq %rax, -136(%rbp)
#            REPORT [tmp8]
movq -136(%rbp), %rdi
callq printInt
#            REPORT str_10
movq $str_10, %rdi
callq printString
#            [tmp9] := [a] SUB64 15
movq -32(%rbp), %rax
movq $15, %rbx
subq %rbx, %rax
movq %rax, -144(%rbp)
#            REPORT [tmp9]
movq -144(%rbp), %rdi
callq printInt
#            REPORT str_11
movq $str_11, %rdi
callq printString
#            [funct] := [print]
movq $gbl_print, %rax
movq %rax, -56(%rbp)
#            setarg 1 1
movq $1, %rdi
#            call funct
movq -56(%rbp), %rax
callq *%rax
#            getret [tmp10]
movq %rax, -152(%rbp)
#            [b] := [tmp10]
movq -152(%rbp), %rax
movq %rax, -24(%rbp)
#            REPORT [b]
movq -24(%rbp), %rdi
callq printInt
#            REPORT str_12
movq $str_12, %rdi
callq printString
#            [x] := 10
movq $10, %rax
movq %rax, -64(%rbp)
lbl_3: #lbl_3:      nop
nop
#            [tmp11] := [x] LT64 19
movq -64(%rbp), %rax
movq $19, %rbx
movq $0, %rcx
cmpq %rbx, %rax
setl %cl
movq %rcx, -160(%rbp)
#            IFZ [tmp11] GOTO lbl_4
movq -160(%rbp), %rax
cmpq $0, %rax
je lbl_4
#            REPORT [x]
movq -64(%rbp), %rdi
callq printInt
#            REPORT str_13
movq $str_13, %rdi
callq printString
#            [x] := [x] ADD64 1
movq -64(%rbp), %rax
movq $1, %rbx
addq %rbx, %rax
movq %rax, -64(%rbp)
#            goto lbl_3
jmp lbl_3
lbl_4: #lbl_4:      nop
nop
#            [x] := 20
movq $20, %rax
movq %rax, -64(%rbp)
#            IFZ 1 GOTO lbl_5
movq $1, %rax
cmpq $0, %rax
je lbl_5
lbl_7: #lbl_7:      nop
nop
#            [tmp12] := [x] GTE64 0
movq -64(%rbp), %rax
movq $0, %rbx
movq $0, %rcx
cmpq %rbx, %rax
setge %cl
movq %rcx, -168(%rbp)
#            IFZ [tmp12] GOTO lbl_8
movq -168(%rbp), %rax
cmpq $0, %rax
je lbl_8
#            REPORT [x]
movq -64(%rbp), %rdi
callq printInt
#            [x] := [x] SUB64 1
movq -64(%rbp), %rax
movq $1, %rbx
subq %rbx, %rax
movq %rax, -64(%rbp)
#            goto lbl_7
jmp lbl_7
lbl_8: #lbl_8:      nop
nop
#            goto lbl_6
jmp lbl_6
lbl_5: #lbl_5:      nop
nop
#            REPORT [x]
movq -64(%rbp), %rdi
callq printInt
lbl_6: #lbl_6:      nop
nop
#            REPORT str_14
movq $str_14, %rdi
callq printString
#            [tmp13] := [a] NEQ64 [b]
movq -32(%rbp), %rax
movq -24(%rbp), %rbx
movq $0, %rcx
cmpq %rbx, %rax
setne %cl
movq %rcx, -176(%rbp)
#            IFZ [tmp13] GOTO lbl_9
movq -176(%rbp), %rax
cmpq $0, %rax
je lbl_9
#            REPORT str_15
movq $str_15, %rdi
callq printString
lbl_9: #lbl_9:      nop
nop
#            REPORT str_16
movq $str_16, %rdi
callq printString
#            setarg 1 5
movq $5, %rdi
#            call donewith665
callq gbl_donewith665
#            REPORT str_17
movq $str_17, %rdi
callq printString
#Fn epilogue main
lbl_2: addq $176, %rsp
popq %rbp
retq

