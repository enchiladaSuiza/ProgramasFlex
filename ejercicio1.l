%{ 
#include <stdio.h>
int mayu = 0;
int min = 0;
%}

%%
[A-Z]	{ printf("Mayuscula\t"); mayu++; }
[a-z]	{ printf("Minuscula\t"); min++; }
%%

int yywrap() {
	return 1;
}

int main () {
	printf("Escribe una cadena de texto\n");
	yylex();
	printf("Mayuscula=%d and Minuscula=%d", mayu, min);
}
