%{
#include <stdio.h>
#include <stdlib.h>
int suma = 0;
%}

DIGITO [0-9]

%%
{DIGITO}+ { suma += atoi(yytext); }
%%

int yywrap() {
	return 1;
}

int main() {
	printf("Escriba diferentes números\n");
	printf("Termine mediante Ctrl+C\n");
	yylex();
	printf("La suma es %d/n", suma);
}
