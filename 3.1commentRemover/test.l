%{
    #include<stdio.h>
    int single=0, multi=0, mlines=0;
%}
%%
"//"[^\n]* {single++;}
"/*"([^*]|[*]+[^*/]|[*]*)*"*/" {
    multi++;
    for(int i = 0; i < yyleng; i++){
        if(yytext[i] == '\n'){
            mlines++;
        }
    }
}

%%
int yywrap(){
    return 1;
}
int main(){
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    printf("single: %d, multi: %d, mlines: %d\n", single, multi, mlines);
    return 0;
}