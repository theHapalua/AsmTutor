%define SYS_EXIT 60
section .data
name: db "Hapalua",0

section .text
    extern hello
    global _start

_start:
    mov rdi, name
    call hello

    mov rax, SYS_EXIT
    mov rdi, 0
    syscall