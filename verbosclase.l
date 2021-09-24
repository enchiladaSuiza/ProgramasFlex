%{
	#include <stdio.h>
	int countverbo = 0;
%}

%%
[\t]+
is|am|are|was|were	{ printf("(%s) es un verbo!\n", yytext); countverbo++; }
[a-zA-Z]+	{ printf("(%s) no es un verbo.\n", yytext); }
.|\n
%%

int yywrap() { }
int main()
{
	yylex();
	printf("\nTotal de verbos: %d", countverbo);
	return 0;
}
