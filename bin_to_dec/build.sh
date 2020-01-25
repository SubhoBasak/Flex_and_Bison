bison -d syn_anlz.y
flex lex_anlz.l
gcc -o a.out syn_anlz.tab.c lex.yy.c
