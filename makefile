default: all

all:
	flex -o analyse_lexicale.c analyse_lexicale.l
	bison -d -o analyse_syntaxique.c analyse_syntaxique.y
	mv analyse_syntaxique.h parser.h
	gcc -o analyse_syntaxique.o -c analyse_syntaxique.c
	gcc -o analyse_lexicale.o -c analyse_lexicale.c
	gcc -o main analyse_syntaxique.o analyse_lexicale.o -lfl
clean:
	rm -rf parser.h analyse_syntaxique.c analyse_lexicale.c 
