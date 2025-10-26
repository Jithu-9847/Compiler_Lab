%{
#include "test.tab.h"
#include <stdio.h>
#include <ctype.h>
%}

%%

[a-z ]+	{yylval.str=yytext;return STR;}
.	{printf("invalid");}
%%


int yywrap()
{
	return 1;
}