%{
#include<stdio.h>
#include"y.tab.h"
%}
%%
"for" {printf("for\n");return FOR;}
[a-zA-Z]* {printf("iden %s\n", yytext);return IDEN;}
[0-9]+ {return NUM;}
[\n ] {}
. {return yytext[0];}
\n return 0;
%%