%{
	#include "fb1-5.tab.h"
%}

%%

"+" { return(ADD); }
"-" { return(SUB); }
"*" { return(MUL); }
"/" { return(DIV); }
"|" { return(ABS); }
"(" { return(OP); }
")" { return(CP); }
[0-9]+ { yylval = atoi(yytext); return(NUM); }
\n { return(EOL); }
[ \t] { ; }
. { ; }

%%

