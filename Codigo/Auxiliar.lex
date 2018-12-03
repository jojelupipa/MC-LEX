%{
/*#include "tabla_simbolos.h"
/*#include <stdlib.h>
#include <string.h>*/


extern YYSTYPE yylval;
%}

%option noyywrap


letra	([a-zA-Z])
digito	([0-9])
alfanumerico	[a-zA-Z_0-9]
identificador		{letra}{alfanumerico}+
entero {digito}+
cadena (\"[^\"]*\")
real {entero}[.]{entero}
caracter (\'[^\']*\')
blanco [ \t]
otros			.

%%
"PRINCIPAL"				return CABECERA;
"ENTERO"				return TIPO;
"REAL"					return TIPO;
"BOOLEANO"				return TIPO;
"CARACTER"				return TIPO;
"SI"					return CONDICION;
"SINO"					return SUBCONDICION;
"MIENTRAS"				return CICLO;
"OPCION"				return OPCION;
"CASO"					return CASO;
"ENTRADA"				return ENTRADA;
"SALIDA"				return SALIDA;
"DEVOLVER"				return RETURN;
"VAR"					return INICIOVARIABLES;
"FINVAR"				return FINVARIABLES;
"VERDADERO"				return CONSTANTES;
"FALSO"					return CONSTANTES;
{caracter}				return CONSTANTES;
{entero}				return ENTERO;
{real}					return CONSTANTES;
","					return COMA;
";"					return FINLINEA;
"("					return PARENTESISABIERTO ;
")"					return PARENTESISCERRADO ; 
"{"					return INIBLOQUE;
"}"					return FINBLOQUE;
"="					return ASIGNACION ;
"=="					return OPBINARIOS ;
"<="					return OPBINARIOS ;
">="					return OPBINARIOS ;
"<"					return OPBINARIOS ;
">"					return OPBINARIOS ;
"&&"					return OPBINARIOS ;
"||"					return OPBINARIOS ;
"*"					return OPBINARIOS ;
"/"					return OPBINARIOS ;
"!="					return OPBINARIOS ;
"**"					return OPBINARIOS ;
"+"					return OPSUMARESTA ;
"-"					return OPSUMARESTA ;
":"					return DOSPUNTOS;
"["					return ABRIRCORCHETE;
"]"					return CERRARCORCHETE;	
"!"					return OPUNARIO;
"^"					return OPBINARIOS;
{cadena}				return CADENA;
"'"					return COMILLA;
[ ]					
{identificador} 			return IDENTIFICADOR;
[\n]					++linea;
[\t]
{otros}					printf("\n(Linea %d) Error lexico: token %s\n",linea,yytext);

%%
