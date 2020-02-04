%option noyywrap

D	[0-9]
L	[A-Za-z]

%{
	#include <stdio.h>
	#include <string.h>

	int chars = 0;
	int words = 0;
	int nums = 0;
	int lines = 0;

	int total_chars = 0;
	int total_words = 0;
	int total_nums = 0;
	int total_lines = 0;
%}

%%

{D}+	{ chars += strlen(yytext); nums++; }
{L}+	{ chars += strlen(yytext); words++; }
"\n"	{ lines++; }
.	{ ; }

%%

int main(int argc, char **argv){
	int i;
	int count;
	FILE *fp;

	if(argc == 1){
		yylex();
		printf("Chars : %d\nWords : %d\nNumbers : %d\nLines : %d\n",
			chars, words, nums, lines);
		count++;
	}
	else if(argc > 1){
		for(i = 1; i < argc; i++){
			fp = fopen(argv[i], "r");

			if(fp != NULL){
				printf("\n%s\n------------------------------------\n", argv[i]);

				yyin = fp;
				yylex();
				printf("Chars : %d\nWrods : %d\nNumbers : %d\nLines : %d\n",
					chars, words, nums, lines);

				total_chars += chars;
				total_words += words;
				total_nums += nums;
				total_lines += lines;

				chars = words = nums = lines = 0;

				count++;
			}
			else{
				printf("\n\"%s\" Not found!\n", argv[i]);
			}
		}

		printf("\nTotal result :\n------------------------------------\n");
		printf("Total chars : %d\nTotal words : %d\nTotal nums : %d\nTotal lines : %d\n",
			total_chars, total_words, total_nums, total_lines);
	}

	return count;
}
