%{
#include<stdio.h>
#include<stdlib.h>
int ans=0;
%}

%token INT FLOAT DOUBLE CHAR NUM IDEN

%%
P: S;
S: ST';' | S ST';';
ST : type var_list;
type:INT|FLOAT|DOUBLE|CHAR;
var_list:var|var_list','var;
var: I|I'['']'|I'['NUM']';
I:IDEN{ans++;};
%%
int main(){
printf("Enter statement\n");
yyparse();
printf("Number of variables is %d",ans);
return 0;
}
void yyerror(){
printf("Invalid\n");
exit(0);
}

