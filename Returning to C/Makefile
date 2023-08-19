make:
	nasm -f elf64 procedure.asm
	gcc -o returntoc.out procedure.o main.c -no-pie

run:
	./returntoc.out