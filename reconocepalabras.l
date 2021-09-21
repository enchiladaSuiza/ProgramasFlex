%{
	#undef yywrap
	int g_argc;
	char** g_argv;
	int num_file = 0;
	int charcount = 0, wordcount = 0, linecount = 0;
%}
word	[^\t\n ]+
eol	\n

%%
{word}	{ wordcount++; charcount = charcount + yyleng; }
{eol}		{ charcount++; linecount++; }
.		charcount++;
%%

int yywrap()
{
	FILE* file_in;
	if (num_file < g_argc - 1)
	{
		num_file++;
		file_in = fopen(g_argv[num_file], "r");
		if (file_in == NULL)
		{
			fprintf(stderr, "error al abrir el fichero %s\n", g_argv[num_file]);
			exit(1);
		}
		yyin = file_in;
		return(0);
	}
	else
	{
		return(1);
	}
}

int main (int argc, char* argv[])
{
	FILE *file_in;
	g_argc = argc;
	g_argv = argv;
	if (argc > 1)
	{
		num_file = 1;
		file_in = fopen(argv[num_file], "r");
		if (file_in == NULL)
		{
			fprintf(stderr, "error al abrir el fichero %s\n", argv[1]);
			exit(1);
		}
		yyin = file_in;
	}
	yylex();
	printf("Líneas: %d, Palabras: %d, Caracteres: %d\n", linecount, wordcount, charcount);
}
