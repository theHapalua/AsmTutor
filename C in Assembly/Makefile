make:
	nasm -f elf64 main.asm
	gcc -o cinasm.out main.o function.c -no-pie -nostartfiles

run:
	./cinasm.out