%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// =====================
// User-defined function
// =====================

// Modify this function to implement any logic
// For example: check prime, even/odd, palindrome, etc.
int FunctionNumber(int n) {
    //Number vachu kalikkunna ethu code um ezhuthikko 😎
}

// For string-based checks
int FunctionString(char *str) {
    //String vachu kalikkunna ethu code um ezhuthikko 😎
}
%}

%%

// =====================
// Lex rules
// =====================

[0-9]+      { 
                int num = atoi(yytext);
                FunctionNumber(num);
            }

[a-zA-Z0-9]+ { 
                FunctionString(yytext);
                 
            }

[ \t\n]+    ;   // skip whitespace and newlines

.           { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    printf("Enter input (Ctrl+D to exit):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
