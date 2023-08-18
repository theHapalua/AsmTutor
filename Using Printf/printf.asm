section .data
    msg: db `Hello World for %d. time\n`;If we use backquotes, we can use c style escape characters
    num: db 10

section .text
    extern printf;getting printf from c
    global _start
_start:
    ;passing the arguments to printf
    mov rdi, msg
    mov rsi, [num]
    call printf

exit:
    mov rax, 60
    mov rdi, 0
    syscall

; arguments are being passed to C functions with rdi, rsi,
; rdx, rcx, r8, r9, *stack*


;I don't know why but if i don't use -nostartfiles while linking with gcc, call printf instruction gives segmentation fault.
;And it doesn't set a starting point if we don't write _start. 