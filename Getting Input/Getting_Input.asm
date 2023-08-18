%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60
%define STDIN 0
%define STDOUT 1

section .data
hello: db "Hello, "
helloLen: equ $-hello
prompt: db "Can you enter your name : ",0x0
promptLen: equ $-prompt

section .bss 
buffer: resb 1024;Creating an uninitialized data buffer to get name, And its length is 1024 bytes


section .text
    global _start
_start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, prompt
    mov rdx, promptLen
    syscall

    ;Setting registers to input from stdin 
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, buffer
    mov rdx, 1024
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, hello
    mov rdx, helloLen
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, buffer
    mov rdx, 1024
    syscall

exit:
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall