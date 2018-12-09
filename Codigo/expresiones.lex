
/* Seccion de declaraciones e inicializaciones */
%{
#include <cstdio>
#include <iostream>
  using namespace std;
  int linea = 0;
  int openBrackets = 0;
  int openBraces = 0;
  int lastOpenBracket, lastOpenBrace;
%}

letra	[a-z]
alfanumerico	[a-z_0-9]
entero [0-9]+
real {entero}"."{entero}
identificador ({letra}|"_")(alfanumerico)*
cadena (\"[^\"]*\")
caracter (\'[^\']\')
mayus [A-Z]+

/* Seccion de reglas (expresiones regulares) */
%%

"#INCLUIR"
"ENTERO"
"REAL"
"CARACTER"
"BOOLEANO"
"CADENA"
"SI"					
"SINO"					 
"MIENTRAS"				
"OPCION"				
"CASO"	
"ROMPER"
"POR-DEFECTO"				
"ENTRADA"				
"SALIDA"				
"DEVOLVER"								
"VERDADERO"				
"FALSO"					
","					
";"					
"(" 	{openBrackets++; if(openBrackets == 1) lastOpenBracket = linea;}				
")"	{openBrackets--; if(openBrackets < 0){ printf("\n(Linea %d) Cierre de paréntesis inesperado.\n",linea); openBrackets = 0;}}
"{"	{openBraces++; if(openBraces == 1) lastOpenBrace = linea;}				
"}"	{openBraces--; if(openBraces < 0) { printf("\n(Linea %d) Cierre de llave inesperado.\n",linea); openBraces = 0;}}
"="					
"=="					
"<="					
">="					
"<"					
">"					
"&&"					
"||"					
"*"					
"/"					
"!="					
"++"
"+"										
"-"
"--"					
":"					
"["					 
"]"					
"!"			
"^"
{letra}	
{alfanumerico}	
{entero}
{real} 
{identificador}
{cadena}
{caracter}
[\t] 
[ ]
[\n]					++linea;
{mayus} printf("\n(Linea %d) Error lexico: Palabra desconocida %s\n",linea,yytext);
. printf("\n(Linea %d) Error lexico: Token desconocido %s\n",linea,yytext);
<<EOF>> {
  if(openBrackets != 0) {
    printf("\nQueda algún paréntesis por cerrar. Abierto en línea %d\n",lastOpenBracket); 
  }
  
  if(openBraces != 0) {
    printf("\nQueda alguna llave por cerrar. Abierta en línea %d\n",lastOpenBrace); 
  }
  yyterminate();
  }





%%
/* Seccion de codigo fuente y main */


int main(int argc, char *argv[]) {

  if (argc ==2) { // Se da fichero como entrada
    yyin= fopen(argv[1], "rt"); // Se abre fichero para lectura en modo texto
    if (!yyin) { // Error
      cout<< "No se pudo abrir el fichero "<< argv[1]<<endl;
      return 0;
    }

  } else { // No se da fichero como entrada: Se coge la entrada desde consola (entrada estandar)

    yyin= stdin;
  }

  yylex(); // Llamada al reconocedor
}
