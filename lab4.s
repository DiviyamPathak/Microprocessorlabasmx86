
.section .data
        array:
        .int 10, 20, 30, 40, 50
        x:
        .int 8
        y:
        .int 10
        remele:
            .int 30
.section .bss
        .lcomm insertedarray 40
        .lcomm fibonacci_array 40
        .lcomm removalarray 20
.section .text
.global _start
_start:
//     //insert n natural numbers 
//         movl $0, %ecx
//         movl $1, %eax
// insarray:
//         movl %eax, insertedarray(, %ecx, 4)
//         addl $1, %eax
//         addl $1, %ecx
//         cmpl $10, %ecx
//         jne insarray

// # insert 60 at 3rd position
// # shifting array(,%edi,4)l the elements to right
//         movl $4, %ecx
// insertelemnt:
//         movl array(, %ecx, 4), %eax
//         addl $1, %ecx
//         movl %eax, array(, %ecx, 4)
//         subl $2, %ecx
//         cmpl $2, %ecx
//         jne insertelemnt
// movl x, %ecx
// subl $1, %ecx
// lcm:
//         movl $0, %edx
//         addl $1, %ecx
//         movl %ecx, %eax
//         divl x
//         cmpl $0, %edx
//         jne lcm
//         movl %ecx, %eax
//         divl y
//         cmpl $0, %edx
//         jne lcm
//         movl %ecx, %r10d

//r10 has answer
    movl $0,%esi
    movl $0, %edi
next:
    //Load the current array element
    movl array(,%edi,4), %esi
    // ; Compare with the remele to be removed
    cmp %esi, remele
    je skip
    // ; If equal, copy the remele
    movl %esi, removalarray(,%edi,4)
    inc %edi

skip:
    // ; Move to the next remele
    cmp $5 ,%edi
    jne next
    movl $1, %eax
    movl $0, %ebx
    int $0x80