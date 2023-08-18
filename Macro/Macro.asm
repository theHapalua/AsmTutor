%define SYS_WRITE 1
%define SYS_EXIT 60
%define STDOUT 1

%macro println 2; Defining argument count for macro
; %1 -> address of message to print
; %2 -> immediate character count to print
;Storing used registers
push rbp
push rax
push rdi
push rsi
push rdx
push r8
push byte 0xa
mov rbp, rsp
;Printing Message
mov rax, SYS_WRITE
mov rdi, STDOUT
mov rsi, %1
mov rdx, %2
syscall
;Printing End Of Line Character
mov rax, SYS_WRITE
mov rdi, STDOUT
mov rsi, rbp
mov rdx, 1
syscall
;Restoring Registers
pop r8
pop r8
pop rdx
pop rsi
pop rdi
pop rax
pop rbp

%endmacro

%macro exit 0

mov rax, SYS_EXIT
mov rdi, 0
syscall

%endmacro
