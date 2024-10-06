%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(const char *s);
%}

%token TYPE RETURN ID NUM LP RP LB RB SC CM EQ OP
%left OP
%left EQ

%%

prog:funcs;
funcs:func|funcs func;
func:TYPE ID LP PARAMS RP LB STMTS RB {printf("Correct\n");};
PARAMS: PARAM_LIST|;
PARAM_LIST: PARAM | PARAM_LIST CM PARAM;
PARAM: TYPE ID;
STMTS : STMT | STMTS STMT;
STMT: TYPE_DECL | RETURN EXPR SC | EXPR SC;
TYPE_DECL: TYPE ID SC| TYPE ID EQ EXPR SC;
EXPR:ID | NUM| EXPR OP EXPR| ID EQ EXPR| LP EXPR RP;
%%

int main(){
return yyparse();
}

void yyerror(const char *s){
printf("Invlaid\n");
exit(0);
}
