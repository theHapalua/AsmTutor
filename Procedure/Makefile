make:
	nasm -f elf64 main.asm
	nasm -f elf64 Procedure.asm
	ld -o Procedure.out Procedure.o main.o

run:
	./Procedure.out