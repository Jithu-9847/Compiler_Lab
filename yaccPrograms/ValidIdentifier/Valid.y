%{
#include <stdio.h>
int valid = 1;
void yyerror(const char *s);
%}

%token IDENTIFIER

%%

start: IDENTIFIER { /* valid identifier */ }
     ;

%%

void yyerror(const char *s)
{
    printf("It's not a valid identifier!\n");
    valid = 0;
}

int main()
{
    printf("Enter a name to test for identifier: ");
    yyparse();
    if(valid)
        printf("It is a valid identifier!\n");
    return 0;
}
