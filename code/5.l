%{
#include "y.tab.h"
extern YYSTYPE yylval;
%}

%%

"int" {return INT;}
"float" {return FLOAT;}
"double" {return DOUBLE;}
"char" {return CHAR;}
[a-zA-Z][a-zA-Z0-9]* {return IDEN;}
[0-9]+ {return NUM;}
[;] {return ';';}
[,] {return ',';}
"[" {return '[';}
"]" {return ']';}
[ \t\n] 
# {return 0;}

%%

int yywrap(){
return 1;
}
