%{
	// #include <stdio.h>
%}

%%

"color" { printf("color\n"); }
"flavour" { printf("flavour\n"); }
"clever" { printf("smart\n"); }
"smart" { printf("clever\n"); }
. { printf("%s\n", yytext); }
 %%
