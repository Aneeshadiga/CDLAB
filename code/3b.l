%{
#include "y.tab.h"
%}

%%

"for" {return FOR;}
"(" { return LPAREN; }
")" { return RPAREN; }
"{" { return LF; }
"}" { return RF; }
[;]   {return ';';}
[,]   
"<" {return '<';}
">" {return '>';}
"=" {return '=';}
"+" {return '+';}
"-" {return '-';}
"==" {return EQ;}
"<=" {return LEQ;}
">=" {return GEQ;}
"+=" {return ADDEQ;}
"-=" {return SUBEQ;}
"--" {return DEC;}
"++" {return INC;}
[ \t\n]* {return yytext[0];}
[a-zA-Z]* {return ALPHA;}
[0-9]* {return NUM;}
# {return 0;}
. {return yytext[0];}
%%
