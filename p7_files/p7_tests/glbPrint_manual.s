.globl main
.data
gbl_a: .quad 0

.text
main: 
#prologue
movq (gbl_a) , %rdi
callq PrintInt
#epilogue