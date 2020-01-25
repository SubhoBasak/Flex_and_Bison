%{
	#include "syn_anlz.tab.h"

	int col = 0;
	int tab;
%}

%%

"1"		{ col++; return(ONE); }
"0"		{ col++; return(ZERO); }
[\n]		{ col = 0; return(EOL); }
[\t]		{ tab = col%8; col = col+(8-tab); }
[ ]		{ col++; }
.		{ col++; }

%%

int yywrap(){
	return 1;
}
