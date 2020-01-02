#include <stdio.h>
#include <ctype.h>
#include "fb1-5.tab.h"

FILE *yyin;
static int seeneof = 0;

int yylex(void){
	if(!yyin){
		yyin = stdin;
	}

	if(seeneof){
		return 0;
	}

	while(1){
		int c = getc(yyin);

		if(isdigit(c)){
			int i = c - '0';

			while(isdigit(c = getc(yyin))){
				i = (i*10)+(c-'0');
			}

			yylval = i;

			if(c == EOF){
				seeneof = 1;
			}
			else{
				ungetc(c, yyin);
			}

			return NUM;
		}

		switch(c){
			case '+': {
				return ADD;
			}
			case '-': {
				return SUB;
			}
			case '*': {
				return MUL;
			}
			case '/': {
				if((c = getc(yyin)) == '/'){
					while(c != '\n'){
						c = getc(yyin);
					}
					return -1;
				}
				else{
					if(c == EOF){
						seeneof = 1;
					}
					ungetc(c, yyin);
					return DIV;
				}
			}
			case '\n': {
                		return EOL;
            		}
		}
	}
}
