%{
	#include <stdio.h>
	int countmay = 0, countotro = 0, countmin = 0, countnum = 0, countverbo = 0;
%}

%%
[\t ]+
is|am	{ printf("(%s) Verbo\n", yytext); countverbo++; }
[A-Z]	{ printf("(%s) Mayúscula\n", yytext); countmay++; }
[a-z]	{ printf("(%s) Minúscula\n", yytext); countmin++; }
[0-9]	{ printf("(%d) Número\n", atoi(yytext)); countnum++; }
.	{ printf("(%s) Otro\n", yytext); countotro++; }
\n	{ ECHO; }
%%

int yywrap() { }
int main() 
{
	printf("Escriba una cadena\n");
	yylex();
	printf("Mayúsculas: %d, Minúsculas: %d, Otros: %d, Números: %d, Verbos: %d", countmay, countmin, countotro, countnum, countverbo);
	return 0;
}
