%{
#include<stdio.h>
int yylex();
int yyerror();
%}
%token NUM
%left '+' '-'
%left '/' '*'
%%
S: I {printf("Result is %d", $1);}
I:I'+'I {$$=$1+$3;}
|I'-'I {$$=$1-$3;}
|I'/'I {$$=$1/$3;}
|I'*'I {$$=$1*$3;}
|'('I')' {$$=$2;}
|NUM {$$=$1;}
|'-'NUM {$$=-$2;}
;
%%
int main(){
    printf("Enter Expression");
    yyparse();
    printf("Done");
}
int yyerror(){
    printf("invalid");
}