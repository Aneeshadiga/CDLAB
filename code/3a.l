%{
#include<stdio.h>
#include<stdlib.h>
int single=0,multi=0,mlines=0;
%}

%%
"//"[^\n]* {single++;}
"/*"[^*]*"*/" {multi++;
	for(int i=0;i<yyleng;i++){
	if(yytext[i]=='\n')
		mlines++;
	}
}
%%

int yywrap(){
return 1;
}

int main(){
yyin=fopen("inp.txt","r");
yyout=fopen("out.txt","w");
yylex();
printf("%d\n%d\n%d", single,multi,mlines);
return 1;
}
