.section .data
	A_1:
		.int 2, 3, 4
	A_2:
		.int 5,4,6
.section .bss
	.comm A_3 12 

.section .text
.global _start

_start:
	movl $0, %eax
	jmp loop
loop:
	movl A_1(,%eax,4),%edx
	addl $1, %edx
	movl %edx, A_2(,%eax,4)
	addl $1 ,%eax
	cmp $2, %eax
	jle loop 
	movl $1, %eax
	movl $0, %ebx
	int $0x80
