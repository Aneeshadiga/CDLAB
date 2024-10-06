%{
#include "y.tab.h"
%}

%%

[a-zA-Z]+ {yylval.sym=yytext[0];return ID;}
[0-9]+ {yylval.sym=yytext[0];return NUM;}
\n {return 0;}
. {return yytext[0];}

%%
int yywrap(){
return 1;
}
