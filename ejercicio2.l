%{ 
#include <stdio.h>
int mayu = 0;
int min = 0;
%}

%%
[A-Z]	{ printf("Mayúscula\t"); mayu++; }
[a-z]	{ printf("Minúscula\t"); min++; }
%%

int yywrap() {
	return 1;
}

int main () {
	printf("Escribe una cadena de texto\n");
	yylex();
	printf("Mayúsculas: %d, Minúsculas: %d", mayu, min);
}
