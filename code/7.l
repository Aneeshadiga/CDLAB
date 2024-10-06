%{
#include "y.tab.h"
%}

%%

"int"|"float"|"void"|"char"|"double" {return TYPE;}
"return" {return RETURN;}
[a-zA-Z_][a-zA-Z0-9]* {return ID;}
[0-9]+ {return NUM;}
"{" {return LB;}
"}" {return RB;}
"(" {return LP;}
")" {return RP;}
";" {return SC;}
"," {return CM;}
"=" {return EQ;}
"+"|"-"|"*"|"/" {return OP;}
[ \t\n] 
# {return 0;}
. 


%%
