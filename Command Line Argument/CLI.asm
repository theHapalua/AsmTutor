%define SYS_WRITE 1
%define SYS_EXIT 60
%define STDOUT 1

section .data
nl: db 0xa

section .bss
buffer : resb 4096;reserving 4 kilobyte buffer
outLen : resb 1

section .text
    global _start

_start:
    ;rsp -> argument count
    ;rsp + 8 -> first argument address(program name)
    ;rsp + 16 -> second argument address(first cli argument)
    mov rsi, [rsp + 16]; moving address of the first argument to rsi
    mov rdi, 0;index
    

;transfering to buffer
transfer:
    cmp byte [rsi+rdi], 0x0;comparing the byte at the current index with null byte. If equals, jumping to print
    je print
    ;Moving from memory address to buffer
    mov r8, [rsi+rdi]
    mov [buffer+rdi], r8
    inc rdi
    jmp transfer




print:
    mov [outLen], rdi;Getting the length of first argument
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, buffer
    mov rdx, [outLen]
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, nl
    mov rdx, 1
    syscall

exit:
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall