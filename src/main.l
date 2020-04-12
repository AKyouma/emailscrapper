%{
#include <stdio.h>
%}

ESPECIAL ([^a-zA-Z0-9]{-}[.,\n ])
LETRAS [a-zA-Z0-9]
ESTRUTURA ({LETRAS}[\.\-\_A-Za-z0-9]*)?{LETRAS}+@({LETRAS}[\.\-\_A-Za-z0-9]*)?{LETRAS}+

%%
\n ;
{ESTRUTURA}{ESPECIAL} ;
{ESTRUTURA}\.\ [^A-Z] ;
{ESTRUTURA},\ [^a-z] ;
{ESTRUTURA}	printf("%s\n", yytext);
. ;
EOF 	return 0;
%%

int main() {
  yylex();
  return 0;
}
