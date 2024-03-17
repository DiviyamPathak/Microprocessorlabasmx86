.section .data
    a32bit:
        .int 0
    a16bit:
        .octa 0 
    a8bit:
        .quad 0 
.section .text
.global _start

_start:
// 32 16 8 data to register
    movl $4294967294, %eax
    movw $65534,%ax 
    movb $254,%al
    // Qs 1 to 3 32 16 8 bit data to memory
    movl $4294967295, a32bit 
    movw $65535,a16bit 
    movb $255, a8bit 
    // 32 16 8 register to mem
    movl %eax, a32bit 
    movw %ax, a16bit
    movb %al,a8bit 
    // 32 16 8 register to register 
    movl %eax, %ebx 
    movw %ax, %bx
    movb %al, %bl 

    # exit
    movl $1, %eax
    movl $0, %ebx
    int $0x80