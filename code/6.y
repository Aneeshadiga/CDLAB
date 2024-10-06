%{
#include<stdio.h>
#include<stdlib.h>
struct incod{
 char op1,op2,opr;
 }arr[20];
int temp='T';
int error=0;
int ind=0;

char AddToTable(char op1,char op2,char opr);
void gencode();
void yyerror();
%}

%union{ char sym;}
%token <sym> ID
%token <sym> NUM
%type <sym> expr
 
%left '+' '-'
%right '*' '/'

%%

problem: ID '=' expr ';'{AddToTable($1,$3,'=');} | expr';' ;
expr:expr '+' expr {$$=AddToTable($1,$3,'+');}
    |expr '-' expr {$$=AddToTable($1,$3,'-');}
    |expr '*' expr {$$=AddToTable($1,$3,'*');}
    |expr '/' expr {$$=AddToTable($1,$3,'/');} 
    |NUM {$$=$1;}
    |ID {$$=$1;}
    |'('NUM')' {$$=$2;};

%%

char AddToTable(char op1,char op2,char opr){
	arr[ind++]=(struct incod){op1,op2,opr};
	char retT=temp;
	if(temp<'Z'){
	temp++;
	}
	return retT;
}
void gencode(){
 	printf("three adress code is\n");
 	for(int i=0;i<ind;i++){
 		if(i==ind-1){
 			printf("%c %c %c\n",arr[i].op1,arr[i].opr,arr[i].op2);
 			break;
 		}
 		printf("%c= %c %c %c\n",temp-ind+i,arr[i].op1,arr[i].opr,arr[i].op2);
 	}
 	
 	printf("Quadriple adress code is=\n");
 	for(int i=0;i<ind;i++){
 		if(i==ind-1){
 			printf("%d %c %c %c\n",i,arr[i].opr,arr[i].op1,arr[i].op2);
 			break;
 		}
 		printf("%d %c %c %c %c\n",i,arr[i].opr,arr[i].op1,arr[i].op2,temp-ind+i);
 	}
 	
 	printf("Triple adress code is=\n");
 	for(int i=0;i<ind;i++){
 		
 		printf("%d %c %c %c\n",i,arr[i].opr,arr[i].op2,arr[i].op1);
 	}
}

int main(){
printf("Enter the Expression (e.g. a = b + c;): ");
yyparse();
if(error==0)
	gencode();
return 0;
}

void yyerror(){
error=1;
printf("ERROR\n");
exit(0);
}



