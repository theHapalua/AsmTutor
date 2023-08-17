%define SYS_OUT 1 ; defining with preprocessor directives
%define STD_OUT 1
%define SYS_EXIT 60
section .data ; This section contains initialized data
    msg : db "Hello World",0xa,0 
    ; msg is a label and refers for an address at memory
    ; db means define byte and it creates an array
    msgLen : equ $-msg 
    ; This gets the length of msg
    ; It doesn't work properly with db and i couldn't understand it yet 
    ; equ means equals, so it defines a constanant
section .bss ; This section contains uninitialized data

section .text ; This section contains instructions
    global _start; Making linker know where to start running instructions

_start:; starting label
    ;Moving values to registers to print our message
    mov rax, SYS_OUT 
    mov rdi, STD_OUT
    mov rsi, msg
    mov rdx, msgLen
    syscall ; Calling kernel to make it do the job that we told with registers

    mov rax, SYS_EXIT
    mov rdi, 0 ; Exit Value
    syscall
