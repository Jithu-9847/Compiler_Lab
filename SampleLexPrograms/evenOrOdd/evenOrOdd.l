%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+      { 
                int num = atoi(yytext);  // convert string to integer
                if (num % 2 == 0)
                    printf("%d is even\n", num);
                else
                    printf("%d is odd\n", num);
            }

[ \t\n]+    ;   // skip whitespace and newlines

.           { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    printf("Enter numbers (Ctrl+D to exit):\n");
    yylex();   // start lexer
    return 0;
}

int yywrap() {
    return 1;
}
