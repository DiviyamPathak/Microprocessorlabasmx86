.section .data
    array:
        .int 1, 67, 4, 5, 6, 0, 78, 34, 0, 32, 2
    val:
        .int 0
.section .text
.globl _start
_start:
        movl $3 ,%eax
        movl array(,%eax,4), %ebx
        movl %ebx ,val
        movl $6 , %eax
        movl array(,%eax,4), %ebx
        addl %ebx , val
        movl $7 , %eax
        movl val , %ecx
        movl %ecx , array(,%eax,4)
        // movl $5 , %eax
        // movl array(,%eax,4) , %ebx
        // movl $8 , %eax
        // movl array(,%eax,4) , %ecx
        // cmp %ebx ,%ecx
        // je equal
        movl $7 , %ebx
        movl $2 , %ecx
        movl array(,%ebx,4), %eax
        div %ecx
        cmp $0 , %edx
        je even

even:
        movl $34 , %esi
movl $1, %eax
movl $0, %ebx
int $0x80
