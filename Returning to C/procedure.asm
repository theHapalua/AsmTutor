section .data

section .text
    global doubler

doubler:
    nop
    mov rax, rdi;get the number
    mov rbx, 2
    mul rbx
    nop
    ret
    ;rax register returns the value