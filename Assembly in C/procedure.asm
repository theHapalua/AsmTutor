%define SYS_WRITE 1
%define STDOUT 1
section .data
msg: db"Hello World",0xa,0x0
msgLen: equ $-msg

section .text
    global hello

hello:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, msgLen
    syscall
