    .section .data

array:
    .long 5, 2, 8, 1, 6, 3, 7, 4
buffer1:
    .int 1,2,3,4,5,6,7,8 

    .section .text
    .globl _start

_start:
    movl $array, %esi         # Address of the array
    movl $8, %ecx             # Length of the array (assuming 8 elements)

outer_loop:
    xorl %edx, %edx           # Reset loop counter
    movl %esi, %edi           # Copy address of the array to edi
inner_loop:
    movl %edi, %eax         # Load array[i] into eax
    cmpl 4(%edi), %eax        # Compare array[i] with array[i+1]
    jle  no_swap              # Jump if array[i] <= array[i+1]
    xchgl %edi, 4(%edi)     # Swap array[i] and array[i+1]
    movl $1, %edx             # Set swap flag to 1
no_swap:
    addl $4, %edi             # Move to next element
    loop inner_loop           # Loop through inner loop ecx times

    testl %edx, %edx          # Check if any swaps occurred
    jnz  outer_loop           # If swaps occurred, continue outer loop

    # Print sorted array
    movl $array, %esi         # Reload address of the array
    movl $8, %ecx             # Reload length of the array
print_loop:
    movl (%esi), %eax         # Load array[i] into eax
    movl $array_fmt, %edi     # Address of format string
    xorl %eax, %ebx           # Move integer to ebx for printf
    call printf               # Call printf to print the integer
    addl $4, %esi             # Move to next element
    loop print_loop           # Loop through print loop ecx times

exit:
    movl $0, %ebx             # Exit code 0
    movl $1, %eax             # System call number for exit
    int $0x80                 # Invoke kernel to exit

.section .data
    .align 4
array_fmt:
    .string "%d "             # Format string for printing integers

.section .bss
    .lcomm buffer, 64         # Buffer for printf

.section .text
    .globl printf
    .type printf, @function
printf:
    pushw (%ebp)                # Save old ebp
    movl %esp, %ebp           # Set ebp as stack pointer
    subl $12, %esp            # Reserve space for local variables

    movl $4, 8(%esp)          # Argument: file descriptor for stdout
    movl 12(%ebp), %eax       # Load address of format string into eax
    movl %eax, 4(%esp)        # Argument: address of format string
    movl $buffer, (%esp)      # Argument: address of buffer for printing

    call printf               # Call printf

    leave                      # Restore previous ebp and esp
    ret                        # Return to caller
