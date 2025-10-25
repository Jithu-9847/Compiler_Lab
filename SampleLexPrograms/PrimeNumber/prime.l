%{
#include <stdio.h>
#include <stdlib.h>

int isPrime(int n) {
    if (n <= 1) return 0; // 0 and 1 are not prime
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return 0;
    }
    return 1;
}
%}

%%

[0-9]+      { 
                int num = atoi(yytext);
                if (isPrime(num))
                    printf("%d is prime\n", num);
                else
                    printf("%d is not prime\n", num);
            }

[ \t\n]+    ;   // skip whitespace and newlines

.           { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    printf("Enter numbers (Ctrl+D to exit):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
