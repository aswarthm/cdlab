%{
#include<stdio.h>
#include<stdlib.h>
typedef char* string;
struct{
    string res;
    string op1;
    string op2;
    char op;
}code[100];
int idx = -1;
int yylex();
int yyerror(char*);
string addToTable(string, string, char);
void quadruples();
void threeAddress();
extern char* yytext;
%}

%union{
    char* exp;
}

%token <exp> NUM IDEN
%type <exp> EXP
%left '+' '-'
%left '*' '/'

%%
STMTS: STMTS STMT {threeAddress(); quadruples();exit(0);
                    }
    |
    ;
STMT: EXP '\n';
EXP: EXP'+'EXP {$$ = addToTable($1, $3, '+');}
|EXP'-'EXP {$$ = addToTable($1, $3, '-');}
|EXP'*'EXP {$$ = addToTable($1, $3, '*');}
|EXP'/'EXP {$$ = addToTable($1, $3, '/');}
|IDEN'='EXP {$$ = addToTable($1, $3, '=');}
|'('EXP')' {$$ = $2;}
|IDEN {$$=$1;}
|NUM {$$=$1;}
;
%%
int main(){
    printf("enter\n");
    yyparse();
}

string addToTable(string op1, string op2, char op){
    if(op == '='){
        code[idx].res = op1;
        return op1;
    }
    idx++;
    string res = malloc(3);
    sprintf(res, "@%c", 'A'+idx);
    code[idx].res = res;
    code[idx].op1 = op1;
    code[idx].op2 = op2;
    code[idx].op = op;
    return res;
}
void threeAddress(){
    for(int i = 0; i <= idx; i++){
        printf("%s=%s %c %s\n", code[i].res, code[i].op1, code[i].op, code[i].op2);
    }
}
void quadruples(){
    for(int i = 0; i <= idx; i++){
        printf("%d: %s %s %s %c\n", i, code[i].res, code[i].op1, code[i].op2, code[i].op);
    }
}

int yyerror(char* err){
    printf("Error %s  %s\n", err, yytext);
}