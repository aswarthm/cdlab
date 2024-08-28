%{
#include<stdio.h>
int yylex();
int yyerror();
%}
%%
S:A B
;
A:'a'A'b'
|
;
B:'b'B'c'
|
;
%%
int main(){
    printf("Enter the string");
    yyparse();
    printf("Valid String\n");
    return 0;
}
int yyerror(){
    printf("Invalid String\n");
    exit(0);
}