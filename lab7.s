.section .data
array: .long 5, 3, 2, 1, 4
length: .long 5

.section .text
.globl _start
_start:
    movl $0x7FFFFFFF, %eax
    movl $0x7FFFFFFF, %ebx
    lea array, %ecx
    movl length, %edx
.L1:
    movl (%ecx), %esi
    cmpl %eax, %esi
    jl .L2
    cmpl %ebx, %esi
    jl .L3
    jmp .L4

.L2:
    movl %eax, %ebx
    movl %esi, %eax
    jmp .L4

.L3:
    movl %esi, %ebx

.L4:
    addl $4, %ecx
    decl %edx
    jnz .L1
    movl %ebx, %esi
    call print_number

    # Exit
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80

.type print_number, @function
print_number:

    ret
