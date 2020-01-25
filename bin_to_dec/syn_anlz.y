%token ONE ZERO EOL

%{
	#include <stdio.h>

	extern int yylex();
	extern int col;

	int yyerror(char *s);
%}

%%

bin_to_dec	: %empty
		| bin_to_dec number EOL		{ printf("In decimal : %d\n", $2); }
		;


number		: number bit		{ $$ = $1 * 2 + $2; }
		| bit			{ $$ = $1; }
		;

bit		: ONE			{ $$ = 1; }
		| ZERO			{ $$ = 0; }
		;

%%

int main(int argc, char **argv){
	yyparse();
}

int yyerror(char *s){
	for(int i = 0; i < col; i++){
		printf("_");
	}
	printf("^\n");
	fprintf(stderr, "error %s\n", s);
}
