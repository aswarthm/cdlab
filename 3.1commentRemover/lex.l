%{
	#include<stdio.h>
	int single=0,multi=0,mlines=0;
	// Removes all C Comments
%}
%%
"//"[^\n]*	{single++;}
"/*"([^*]|[*]+[^*/]|[*]*)*"*/"	{ //    "/*" ( [^*] | [*]+[^*/] | [*]* )* "*/" //       /\* [\s\S] *? \*/
	multi++;
	for(int i=0;i<yyleng;i++)
	{
		if(yytext[i]=='\n')
			mlines++;
	}
}
%%
int yywrap()
{
	return 1;
}
int main()
{
	yyin=fopen("input.txt","r");
	yyout=fopen("output.txt","w");
	yylex();
	printf("Single: %d\n Multi: %d\nMlines: %d\n",single,multi,mlines);
	return 0;
}