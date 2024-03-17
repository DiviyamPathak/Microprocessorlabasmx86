.section .data
   
    side1:
            .int 6   
    side2:
            .int 5      
    side3:
            .int 7      
.section .text
.global _start

_start:
        movl side1 ,%eax
        movl side2,%ebx
        movl side3,%ecx
        cmp %eax,%ebx
        je equilateralornot
        cmp %eax,%ecx
        je equilateralornot
        cmp %ebx,%ecx
        je equilateralornot
        movl $677, %edi


equilateralornot:
        cmp %ebx,%ecx
        jne isosceles
        cmp %ecx,%ebx
        jne isosceles
        cmp %ecx,%eax
        jne isosceles
        movl $45, %edi
        
isosceles:
        movl $32, %edi


