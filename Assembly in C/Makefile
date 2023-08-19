make:
	nasm -f elf64 procedure.asm
	gcc -o asminc.out main.c procedure.o -no-pie

run:
	./asminc.out