D [0-9]

%{

	enum yytokentype{
		NUM = 258,
		ADD = 259,
		SUB = 260,
		MUL = 261,
		DIV = 262,
		ABS = 263,
		EOL = 264 };

	int yylval;

%}

%%

"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
{D}+ { yylval = atoi(yytext); return NUM; }
\n { return EOL; }
[ \t] { ; }
. { printf("Mystery character %c\n", *yytext); }

%%

int main(int argc, char **argv){
	int tok;

	while (tok = yylex()){
		printf("%d", tok);
		if(tok == NUM){
			printf(" = %d\n", yylval); }
		else{
			printf("\n"); }
	}
}
