.section .data
str1:
.ascii "coping with life" # length 36
string:
.ascii "weshallovercomesomeday"
msg_eq:
.ascii "The two are equal\n" # length 25
msg_not_eq:
.ascii "The two are not equal\n" # length 29
strnrem:
.ascii "hi welcome"
compare_str1:
.ascii "Rasam"
compare_str2:
.ascii "Sambar"
vvowelcount:
.int 0

.section .bss
    .lcomm strcp 36

.section .text
.global _start
_start:
# copying msg1 to msg2
movl $0, %ecx # index
copystr:
movb str1(, %ecx, 1), %al
movb %al, strcp(, %ecx, 1)
addl $1, %ecx
cmpl $36 , %ecx
jne copystr

# Count vowels in 'string'
movl $0, %ecx
loop:
movb string(, %ecx, 1), %al
cmpb $97, %al
je vowels
cmpb $101, %al
je vowels
cmpb $105, %al
je vowels
cmpb $111, %al
je vowels
cmpb $117, %al
je vowels
jmp loopforcheck
vowels:
addl $1, vvowelcount
loopforcheck:
addl $1, %ecx
cmpl $18, %ecx
jne loop
jmp removecharatfirst

removecharatfirst:
movl $0, %edi
movb $32 ,%r10b
movb %r10b, strnrem(,%edi,1)

//comparing for equals
movl $0, %ecx
compareuntill:
movb compare_str1(, %ecx, 1), %al
movb compare_str2(, %ecx, 1), %bl
cmpb %al, %bl
jne print_not_equal
cmpb $0, %al
je print_equal
addl $1, %ecx
jmp compareuntill

print_equal:
# printing equal
movl $4, %eax
movl $1, %ebx
leal (msg_eq), %ecx
movl $25, %edx
int $0x80

print_not_equal:
# printing not equal
movl $4, %eax
movl $1, %ebx
leal (msg_not_eq), %ecx
movl $29, %edx
int $0x80

exit:
movl $1, %eax
movl $0, %ebx
int $0x80
