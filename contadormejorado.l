%{
	int arguments;
    char **fileList;
	unsigned currentFile = 0;
    unsigned long charCount = 0, wordCount = 0, lineCount = 0;
    unsigned long totalChars = 0, totalWords = 0, totalLines = 0;
%}

letter	[a-zA-Z]
digit	[0-9]

%%
\n|\z              			{ lineCount++; }
({letter}+[-']*{letter}*)+	{ charCount += yyleng; wordCount++; }
[^ \n\t]					{ charCount++; }
[ \t]						;
%%

int main (int argc, char** argv)
{
	arguments = argc;
	fileList = argv;

	FILE* file;
	if (arguments > 1) // Hay archivos
	{
		currentFile = 1;
		file = fopen(fileList[currentFile], "r");
		if (file == NULL)
		{
			fprintf(stderr, "\nError reading file %s\n", fileList[currentFile]);
			exit(1);
		}
		yyin = file;
	}

	yylex();
	if (arguments == 2) // Sólo hay un archivo
	{
		printf("\nWords: %d, Characters: %d, Lines: %d - %s\n",
			wordCount, charCount, lineCount, fileList[currentFile]);
	}
    return 0;
}

int yywrap()
{
	FILE* file;
	if (currentFile < arguments)
	{
		printf("\nWords: %d, Characters: %d, Lines: %d - %s\n",
			wordCount, charCount, lineCount, fileList[currentFile]);
		totalChars += charCount;
		totalWords += wordCount;
		totalLines += lineCount;
		charCount = wordCount = lineCount = 0;
		fclose(yyin);

		currentFile++;
		if (currentFile == arguments) // Ese fue el último archivo
		{
			printf("\nTotal words: %d, Total characters: %d, Total lines: %d\n",
				totalWords, totalChars, totalLines);
			exit(1);
		}

		file = fopen(fileList[currentFile], "r");
		if (file == NULL)
		{
			fprintf(stderr, "Error reading file %s\n", fileList[currentFile]);
			exit(1);
		}
		yyin = file;
		return 0;
	}
	return 1;
}