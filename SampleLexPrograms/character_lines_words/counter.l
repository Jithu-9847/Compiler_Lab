%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
FILE *yyin;
int words = 0, lines = 0, chars = 0;
%}
%%

[a-zA-Z.]+	    {words++;chars+=strlen(yytext);}
[ \t]		    {chars++;}
[\n]		    {lines++;}
.		        {chars++;}

%%
int main() {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        perror("Error opening input.txt");
        return 1;
    }
    yylex();
    printf("\nNumber of words = %d\n", words);
    printf("Number of lines = %d\n", lines);
    printf("Number of characters = %d\n", chars);
    return 0;
}
int yywrap() { return 1; }
