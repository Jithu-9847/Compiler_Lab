%{
#include <stdio.h>
#include <string.h>

void checkPalindrome(char *str) {
    int len = strlen(str);
    int flag = 1; 

    for (int i = 0; i < len / 2; i++) {
        if (str[i] != str[len - i - 1]) {
            flag = 0;
            break;
        }
    }

    if (flag)
        printf("\"%s\" is a palindrome\n", str);
    else
        printf("\"%s\" is not a palindrome\n", str);
}
%}

%%

[a-zA-Z0-9]+      { checkPalindrome(yytext); }

[ \t\n]+          ;   // skip whitespace and newlines

.                 { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    printf("Enter strings or numbers (Ctrl+D to exit):\n");
    yylex();   // start lexer
    return 0;
}

int yywrap() {
    return 1;
}
