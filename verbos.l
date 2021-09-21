%option noyywrap
%{
#include <stdio.h>
%}

%%

[\t ]+
is|am|are|were	{ printf("%s is a verb!\n", yytext); }
[a-zA-Z]+	{ printf("%s is not a verb.\n", yytext); }

%%

int main () {
	printf("Write a sentence\n");
	yylex();
	return 0;
}
