%{
#include"y.tab.h"
#include<stdlib.h>
extern YYSTYPE yylval;
%}
%%
[0-9]+ {yylval = atoi(yytext); return NUM;}
. {return yytext[0];}
\n {return 0;}
%%