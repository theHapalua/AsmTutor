%define SYS_WRITE 1
%define STDOUT 1

section .data
nl: db 0xa

section .text
    global println; making procedure accessable from another files

println:
    ;You can pass parameters 
    ;rdi -> Message Address
    ;rsi -> Immediate character count
    nop;does nothing but i will use it
    ;Pushing arguments to stack
    push rdi
    push rsi 
    
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, [rsp + 8]
    mov rdx, [rsp]
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, nl
    mov rdx, 1
    syscall
    ;removing arguments to stack
    pop rsi 
    pop rdi

    nop
    ret