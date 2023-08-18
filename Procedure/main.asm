section .data
msg : db "Hello World"
msgLen: equ $-msg

section .text
    global _start
    extern println;Telling assembler that this procedure will be linked later
_start:
    mov rdi, msg;first argument
    mov rsi, msgLen;second argument
    call println;calling procedure

exit:
    mov rax, 60
    mov rdi, 0
    syscall