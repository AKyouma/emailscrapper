/*
  NOME: AUGUSTO LOURENÇO DE FARIA 
  RA: 194447
  DATA: 12/04/2020
*/
%{
#include <stdio.h>
%}

CARAC [a-zA-Z0-9]
/*Caracteres válidos*/
ESPECIAL ([^a-zA-Z0-9]{-}[.,\n ])
/*Especiais para contorno*/
ESTRUTURA ({CARAC}[\.\-\_A-Za-z0-9]*)?{CARAC}+@({CARAC}[\.\-\_A-Za-z0-9]*)?{CARAC}+
/*Estrutura do email: Caracter e zero ou mais repetições dos especiais válidos podendo ser opcional (?)
		      Caracter com uma ou mais repetições (+) e @
		      Caracter e zero ou mais repetições dos especiais válidos podendo ser opcional (?)
		      Caracter com uma ou mais repetições (+)
*/
%%
\n ;
{ESTRUTURA}{ESPECIAL} ;
{ESTRUTURA},\ [^a-z] ;
{ESTRUTURA}\.\ [^A-Z] ;
{ESTRUTURA}	printf("%s\n", yytext);
. ;
%%

int main() {
  yylex();
  return 0;
}
