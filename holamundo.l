%{
#include <stdio.h>
%} 

%%

%%

int yywrap() {
	return 1;
}

int main() {
	printf("Hola mundo");
	yylex();
}
