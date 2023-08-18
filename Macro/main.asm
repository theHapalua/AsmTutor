%include "Macro.asm";including macro file

section .data
msg: db "Hello, World"
msgLen: equ $-msg

section .bss


section .text
    global _start

_start:
    ;Calling macros and giving parameters
    println msg, msgLen
    println msg, msgLen
    exit