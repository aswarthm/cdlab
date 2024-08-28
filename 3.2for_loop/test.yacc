%{
#include<stdio.h>
int cnt=0;
int yyerror();
int yylex();
%}
%token FOR IDEN NUM
%%
S:I {return 0;}
;
I: FOR A B {cnt++;}
;
A: '('E';'E';'E')'
;
E: IDEN Z IDEN
|IDEN Z NUM
|IDEN U
|IDEN
;
Z: '='
|'<'
|'>'
|'<''='
|'>''='
|'!''='
;
U: '+''+'
|'-''-'
;
B: B B 
|'{'B'}'
|I
|E';'
|
;
%%
int main(){
    printf("Input\n");
    yyparse();
    printf("Done %d\n", cnt);
    return 0;
}
int yyerror(){
    printf("error");
}