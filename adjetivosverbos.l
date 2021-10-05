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

veloz |
grande |
lento |
oscuro |
entusiasta |
interesante |
gracioso |
nublado |
elegante { printf("'%s' es un adjetivo!\n", yytext); }

a |
ante |
desde |
para |
de |
entre |
atras |
junto |
enfrente |
debajo	{ printf("'%s' es una preposición!\n", yytext); }

yo |
tu |
el |
ella |
ustedes |
ellos |
nosotros	{ printf("'%s' es un pronombre!\n", yytext); }

y |
o |
entonces |
u	{ printf("'%s' es una conjunción!\n", yytext); }

[a-zA-Z]+	{ printf("'%s' no es nada...\n", yytext); }
\n	ECHO;

%%
int yywrap()
{
	return 1;
}

int main()
{
	printf("Escribe una cadena de texto\n");
	yylex();
	return 0;
}