%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
void yyerror();
%}

%token NUM
%left '-' '+'
%left '*' '/'

%%
S:I{printf("Result is%d\n",$$);};
I: I'+'I {$$=$1+$3;}
  |I'-'I{$$=$1-$3;}
  |I'*'I{$$=$1*$3;}
  |I'/'I{if($3==0){yyerror();}else{$$=$1/$3;}}
  |'('I')'{$$=$2;}
  |'-'NUM {$$=-$1;}
  |NUM {$$=$1;};
%%

int main(){
printf("Enter an expression\n");
yyparse();
printf("Valid\n");
return 1;
}
void yyerror(){
printf("Invalid\n");
exit(0);
}
