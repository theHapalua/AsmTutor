make:
	nasm -f elf64 printf.asm
	gcc -o printf.out printf.o -no-pie -nostartfiles

run:
	./printf.out