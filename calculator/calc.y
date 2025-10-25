%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
    | input expr '\n'  { printf("Result = %d\n", $2); }
;

expr:
      NUMBER                  { $$ = $1; }
    | expr '+' expr           { $$ = $1 + $3; }
    | expr '-' expr           { $$ = $1 - $3; }
    | expr '*' expr           { $$ = $1 * $3; }
    | expr '/' expr           { $$ = $1 / $3; }
    | '(' expr ')'            { $$ = $2; }
    | '-' expr %prec UMINUS   { $$ = -$2; }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Simple Calculator\nPress enter after typing an expression.\n");
    yyparse();
    return 0;
}
