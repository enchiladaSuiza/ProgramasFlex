%option noyywrap
%{
    int ifCount = 0, elseCount = 0, forCount = 0, intCount = 0, floatCount = 0;
%}

space [ ]
punctuation [,;:!?\.]

%%
.*"if".*\n      { printf("Found 'if'\t"); ifCount++; ECHO; }
.*"else".*\n    { printf("Found 'else'\t"); elseCount++; ECHO; }
.*"for".*\n     { printf("Found 'for'\t"); forCount++; ECHO; }
.*"int".*\n     { printf("Found 'int'\t"); intCount++; ECHO; }
.*"float".*\n   { printf("Found 'float'\t"); floatCount++; ECHO; }
.*  ;
\n  ;
%%

int main()
{
    yylex();
    printf("\nAppearances\nif: %d, else: %d, for: %d, int: %d, float: %d\n", ifCount, elseCount, forCount, intCount, floatCount);
}