%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
void yyerror(const char* s);
int yylex(void);
%}


%union{
	char* str;
};

%token <str> STR
%%

input:
      /* empty */
    | input line 
;

line:
    STR {
    		for(int i=0;i<strlen($1);i++)
    			printf("%c",toupper($1[i]));
    }
;
%%

int main()
{
	printf("Enter the string:");
	yyparse();
	return 0;
}

void yyerror(const char* s)
{
	printf("Error!");
}
