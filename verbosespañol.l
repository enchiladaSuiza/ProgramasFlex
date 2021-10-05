%{
	#include <stdio.h>
%}

%%

[ \t]+	;
es |
soy |
eres |
era |
ser |
siendo |
estando |
hace |
hizo |
ir	{ printf("'%s' es un verbo!\n", yytext); }

[a-zA-Z]+	{ printf("'%s' no es verbo\n", yytext); }
\n  ECHO;

%%

int yywrap() { return 1; }

int main()
{
	printf("Escribe una cadena de texto\n");
	yylex();
	return 0;
}