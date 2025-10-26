%{
#include <stdio.h>
#include <ctype.h>
%}

%%

[a-z]+	{for(int i=0;i<strlen(yytext);i++)printf("%c",toupper(yytext[i]));}

%%

int main()
{

	printf("Enter the String:");
	yylex();
	return 0;

}

int yywrap()
{
	return 1;
}