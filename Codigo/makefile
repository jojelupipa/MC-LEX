
all: ficherolex
	g++ -o analizar ficheroLex.cpp -ll

ficherolex:
	lex -o ficheroLex.cpp expresiones.lex

ejecuta:
	./ejemplo fichero.txt

clean:
	rm -f -r *.cpp
	rm -f -r analizar
