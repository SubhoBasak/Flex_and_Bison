WORD	[A-Za-z]

%{
	#include <stdio.h>

	int words = 0;
	int chars = 0;
	int lines = 0;
	int spaces = 0;

%}

%%

{WORD}+ { words++; chars += strlen(yytext); }
\n { chars++; lines++; }
" " { spaces++; chars++; }

%%

int main(int argc, char **argv){

	yylex();
	printf("Lines : %8d\nWords : %8d\nCharacters : %8d\nSpaces %8d\n", lines, words, chars, spaces);

	return(0);
}
