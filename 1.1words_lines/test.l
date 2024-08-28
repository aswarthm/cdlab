%{
#include<stdio.h>
int lines=0, words=0, chars=0, spaces=0;
%}
%%
\n  {lines++;}
\t  {spaces+=4;}
[ ] {spaces+=1;}
[^ \t\n#]+ {words+=1;chars+=yyleng;}
# {return 0;}
%%
int yywrap(){
    return 1;
}
int main(){
    printf("Enter the string\n");
    yylex();
    printf("Lines:%d, Words: %d, Chars: %d, spaces: %d\n", lines, words, chars, spaces);
    return 0;
}