
/* Seccion de declaraciones e inicializaciones */
%{
#include <cstdio>
#include <iostream>
using namespace std;

%}


letra	[a-zA-Z]
digito	[0-9]
entero  [1-9]{digito}+
real  ({entero}".")|({entero}"."{digito}+)
identificador ({letra}|"_")({letra}|"_"|{digito})*


/* Seccion de reglas (expresiones regulares) */
%%
{real}  {cout <<"He reconocido el real "<<yytext<<endl; }
{entero}  { cout << "He reconocido el entero "<<yytext<<endl; }
{identificador} {cout<<"He reconocido el identificador "<<yytext<<endl;}
. {}




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
