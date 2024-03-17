.section .data
.section .bss
        .lcomm fibonacci_array 40
.section .text
.global _start
_start:
    movl $0 ,%eax
    movl $1 ,%ebx
    movl %eax , fibonacci_array(,%eax,4)
    movl %ebx , fibonacci_array(,%ebx,4)
    movl $2,%esi
    fibonacci:
            movl %ebx ,%ecx
            addl %eax , %ebx
            movl %ebx , fibonacci_array(,%esi,4)
            movl %ecx , %eax
            inc %esi 
            cmp $10, %esi
            jne fibonacci

// # result fibonacci_array has first 10 fibonacci numbers
            movl $1, %eax
            movl $0, %ebx
            int $0x80