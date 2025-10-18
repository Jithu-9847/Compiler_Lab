%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER

%%

expr:
      expr '+' expr   { printf("= %d\n", $1 + $3); }
    | expr '-' expr   { printf("= %d\n", $1 - $3); }
    | expr '*' expr   { printf("= %d\n", $1 * $3); }
    | expr '/' expr   { printf("= %d\n", $1 / $3); }
    | '(' expr ')'    { $$ = $2; }
    | NUMBER          { $$ = $1; }
    ;

%%

int main() {
    printf("Simple Calculator (enter expressions like 2+3*4)\n");
    printf("Press Enter after typing an expression.\n\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
