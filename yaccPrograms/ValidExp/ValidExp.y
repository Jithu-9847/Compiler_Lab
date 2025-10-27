%{
#include <stdio.h>
int valid = 1;
int yyerror(const char* s);
int yylex(void);
%}

%token num id op

%%

start : id '=' s ';' ;

s : id x
  | num x
  | '-' num x
  | '(' s ')' x
  ;

x : op s
  | '-' s
  | 
  ;

%%


int main() {
    printf("\nEnter the expression:\n");
    yyparse();
    if(valid) {
        printf("\nValid expression!\n");
    }
}

int yyerror(const char* s) {
    valid = 0;
    printf("\nInvalid expression!\n");
    return 0;
}

