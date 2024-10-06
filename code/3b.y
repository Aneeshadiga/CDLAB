%{
#include<stdio.h>
#include<stdlib.h>
int count=0;
void yyerror();
%}

%token FOR LPAREN RPAREN LF RF ADDEQ SUBEQ EQ LEQ GEQ INC DEC ALPHA NUM 

%%

S:I;
I:FOR A B{count++;} ;
A:LPAREN E';'E';'E RPAREN ;
E: ALPHA Z ALPHA
  |ALPHA Z NUM
  |ALPHA U
  | ;
Z: '<' |'>'|'='|'+'|'-'|
   SUBEQ|EQ|ADDEQ|LEQ|GEQ ;
U :INC|DEC ;
B: ALPHA I | I | LF B RF| ALPHA|;

%%

int yywrap(){
return 1;
}

int main(){
printf("Enter code snippet\n");
yyparse();
printf("Valid number of for loops are %d,",count);
return 0;
}
void yyerror(){
printf("Invlaid input\n");
}
