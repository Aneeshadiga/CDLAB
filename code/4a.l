%{
#include<stdio.h>
#include<stdlib.h>
int key=0,op=0,id=0;
%}

%%
"int"|"float"|"double"|"char"|"main()"|"return"|"switch"|"case"|"if"|"else"|"for"|"while"|"do" {key++;}
[a-zA-Z_][a-zA-Z_]* {id++;}
[0-9]
[;]
[,]
[\+\-\*\/\(\)\{\}\&\|\!\=] {op++;}
[\t\n]+
[#] {return 0;}
[.] {printf("Invlaid\n");}
%%

int yywrap(){
return 1;
}

int main(){
yyin=fopen("eg.c","r");
yylex();
printf("%d\n%d\n%d\n",key,id,op);
return 0;
}
