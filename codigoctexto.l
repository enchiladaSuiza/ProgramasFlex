%{
    #include <stdio.h>
%}

%%

break |
case |
const |
continue |
do |
else |
for |
goto |
if |
inline |
return |
switch |
typedef |
while |
printf |
scanf |
atoi |
strcpy |
strcat |
gets |
strerror { printf("'%s' es una palabra reservada\n", yytext); }

char |
unsigned |
signed |
int |
long |
short |
float |
double |
void |
string { printf("'%s' es un tipo de dato\n", yytext); }

\(\"[^"]*\"\)  { printf("'%s' es texto que saldrá en pantalla\n", yytext); }

"/*"[^*]*"*/"   { printf("'%s' es un comentario\n", yytext); }

[_a-z]+[0-9a-zA-Z]*    { printf("'%s' es una variable\n", yytext); }

.   ;
\n  ECHO;

%%

int yywrap() { return 1; }

int main()
{
    printf("Escriba código en C\n");
    yylex();
    return 0;
}