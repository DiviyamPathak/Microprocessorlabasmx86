.section .data
    array:
        .int 5, 6, 7, 8, 0, 1, 2, 3, 4, 9 # length 10
    target:
        .int 4
    indexoftarget:
        .int -1
    input:
        .ascii "21ETMC412008@msruas.ac.in"# length 25
    inputcnt:
        .ascii "ghd @fkn@fkjfo@sjlns@"
    targetchar:
        .ascii "@"
    countchar:
        .int 0
.section .bss
    .lcomm output 25
.section .text
.global _start
_start:
# searching 
movl $0, %ecx # index
searching:
movl array(, %ecx, 4), %eax
addl $1, %ecx # index++
cmpl target, %eax# if array[index] == target
je found
cmpl $10, %ecx # exit if index > size
jne searching
jmp specialchar
found:
subl $1, %ecx
movl %ecx, indexoftarget

specialchar:
movl $0, %ecx
movl $0, %ebx
loop:
movb input(, %ecx, 1), %al
jmp L1
continue_loop:
addl $1, %ecx
cmpl $25, %ecx
jne loop
jmp print
L1:
cmpb $96, %al
jle L2
cmpb $122, %al
jle continue_loop
L2:
cmpb $64, %al
jle L4
cmpb $90, %al
jle continue_loop
L4:
cmpb $47, %al
jle L5
cmpb $57, %al
jle continue_loop
L5:
movb input(, %ecx, 1), %al
movb %al, output(, %ebx, 1)
addl $1, %ebx
jmp continue_loop
print:
movl $4, %eax
movl $1, %ebx
leal (output), %ecx
movl $25, %edx

charcount:
movl $0,%eax
movl $0,%ebx
movl $0,%ecx
movl $0,%edx

loopcount:
movb inputcnt(,%eax,1) , %bl
cmpb %bl , targetchar
je addcount
inc %eax
cmpl $25 , %eax
je printcount

addcount:
addl $1 , countchar
inc %eax
cmpl $25 , %eax
jl loopcount

printcount:
leal countchar , %ecx


exit:
movl $1, %eax
movl $0, %ebx
int $0x80