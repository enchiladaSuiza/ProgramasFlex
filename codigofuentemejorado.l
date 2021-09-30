%option noyywrap
%{
    int comments, code, whitespace;
    int braces, keywords, constants;
    int funcDefs, funcDecs;
%}

%x COMMENT
%x BRACES
%%
if|else|for|while |
int|char|string |
class|struct|return { keywords++; }

^[ \t]*\n   { whitespace++; }
[ \t]*      { whitespace++; }

[0-9]+  { constants++; }

[a-z][a-zA-Z ]*"("[a-zA-Z ]*")"[ \n]*"{"[.\n]*  { funcDefs++; BEGIN BRACES; }
[a-z][a-zA-Z ]*"("[a-zA-Z ]*")"[ \n]*"{".*"}"\n { funcDefs++; }
[a-z][a-zA-Z ]*"("[a-zA-Z ]*");"[ \n]*  { funcDecs++; }


^[ \t]*"/*"                 { BEGIN COMMENT; }
^[ \t]*"/*".*"*/"[ \t]*\n   { comments++; }

<COMMENT>.*"*/"[ \t]*\n     { BEGIN 0; comments++; }
<COMMENT>.*"*/"             { BEGIN 0; }
<COMMENT>\n                 { comments++; }
<COMMENT>.*\n               { comments++; }

^[ \t]*"{"                  { BEGIN BRACES; }
^[ \t]*"{".*"}"[ \t]*\n     { braces++; }

<BRACES>.*"}"[ \t]*\n       { BEGIN 0; braces++; }
<BRACES>.*"}"               { BEGIN 0; }
<BRACES>\n                  { braces++; }
<BRACES>.*\n                { braces++; }

.+"/*".*"*/".*\n            { code++; }
.*"/*".*"*/".+\n            { code++; }
.+"/*".*\n                  { code++; BEGIN COMMENT; }
.+"{".*"}".*\n              { code++; }
.*"{".*"}".+\n              { code++; }
.+"{".*\n                   { code++; BEGIN BRACES; }
.\n                         { code++; }
.                           ;
%%

int main()
{
    yylex();
    printf("\nCode: %d, Comments %d, Whitespace %d,\n"
        "Braces: %d, Keywords: %d, Constants: %d,\n"
        "Function definitions: %d, Function declarations: %d\n",
        code, comments, whitespace, braces, keywords, constants, funcDefs, funcDecs);
}
