bison -d fb1-5.y
flex fb1-5.l
gcc -o a.out fb1-5.tab.c lex.yy.c -lfl
