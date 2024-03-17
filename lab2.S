.section .data
    a:
        .int 0
    b: 
        .int 2 
    c:
        .int 3
    d: 
        .int 4
.section .text
.global _start

_start:
    // b and c xor d
    movb b , %al
    andl c , %eax
    movb d ,%bl
    xorb %al , %bl
    movl %ebx, a

    // a = b xor c or d
    movb b , %al
    xorl c , %eax
    movb d ,%bl
    orl %eax , %ebx
    movl %ebx, a

    # exit
    movl $1, %eax
    movl $0, %ebx
    int $0x80