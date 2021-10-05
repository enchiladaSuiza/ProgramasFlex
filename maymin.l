%{
    #include <stdio.h>
%}

%%

[ \t\n] ECHO;
[0-9]+  { printf("Números\n"); }
[A-Z]   { putchar(yytext[0] + 'a' - 'A'); }
Á   { putchar('á'); }
É   { putchar('é'); }
Í   { putchar('í'); }
Ó   { putchar('ó'); }
Ú   { putchar('ú'); }

%%

int yywrap() { return 1; }

int main()
{
    printf("Escriba una cadena de texto\n");
    yylex();
    return 0;
}
