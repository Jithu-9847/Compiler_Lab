%{
#include <stdio.h>
FILE *yyin;
%}

/* Definitions of regular expressions */
DIGIT   [0-9]
ID      [a-zA-Z_][a-zA-Z0-9_]*
KEYWORD (if|else|while|return|int|float)

%%

{KEYWORD}       { printf("| %-10s | %-20s |\n", "Keyword", yytext); }
{ID}            { printf("| %-10s | %-20s |\n", "Identifier", yytext); }
{DIGIT}+        { printf("| %-10s | %-20s |\n", "Number", yytext); }
"+"             { printf("| %-10s | %-20s |\n", "Operator", "Plus"); }
"-"             { printf("| %-10s | %-20s |\n", "Operator", "Minus"); }
"*"             { printf("| %-10s | %-20s |\n", "Operator", "Multiply"); }
"/"             { printf("| %-10s | %-20s |\n", "Operator", "Divide"); }
"="             { printf("| %-10s | %-20s |\n", "Operator", "Assignment"); }
[ \t\n]+        { /* skip whitespace */ }
.               { printf("| %-10s | %-20s |\n", "Unknown", yytext); }

%%

int main(int argc, char **argv)
{
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        perror("Error opening input.txt");
        return 1;
    }

    printf("+------------+----------------------+\n");
    printf("| Token Type | Token Value          |\n");
    printf("+------------+----------------------+\n");
    yylex(); 
    printf("+------------+----------------------+\n");

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}
