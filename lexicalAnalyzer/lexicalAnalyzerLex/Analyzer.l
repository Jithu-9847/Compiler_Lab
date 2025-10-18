%{
#include <stdio.h>
#include <string.h>

// Keyword list
const char *keywords[] = {
    "if", "else", "while", "for", "return", "int", "float", "char", "double", "void"
};
int num_keywords = sizeof(keywords) / sizeof(keywords[0]);

// Function to check if a word is a keyword
int isKeyword(const char *word) {
    for (int i = 0; i < num_keywords; i++) {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}

FILE *yyin;     // input file
FILE *yyout;    // output file
int line_no = 1;
int token_no = 1;
%}

%%

[ \t]+                ;   // skip whitespace
\n                    { line_no++; }

[a-zA-Z_][a-zA-Z0-9_]*    {
    if (isKeyword(yytext))
        fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "KEYWORD", yytext);
    else
        fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "IDENTIFIER", yytext);
}

[0-9]+(\.[0-9]+)?         { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "NUMBER", yytext); }

"=="|">="|"<="|"!="       { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "RELATIONAL OP", yytext); }
"="                       { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "ASSIGNMENT OP", yytext); }
"\+"|"-"|"*"|"/"|"%"      { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "ARITHMETIC OP", yytext); }
"&&"|"||"|"!"             { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "LOGICAL OP", yytext); }

";"                       { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "SEMICOLON", yytext); }
","                       { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "COMMA", yytext); }
"("                       { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "LEFT PAREN", yytext); }
")"                       { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "RIGHT PAREN", yytext); }
"{"                       { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "LEFT BRACE", yytext); }
"}"                       { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "RIGHT BRACE", yytext); }

.                         { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "OTHER", yytext); }

%%

int main() {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        printf("Error: Cannot open input.txt\n");
        return 1;
    }

    yyout = fopen("output.txt", "w");
    if (!yyout) {
        printf("Error: Cannot open output.txt\n");
        fclose(yyin);
        return 1;
    }

    // Print table header
    //Table vrithikku venam ennu ondengile thazhathe use cheyyaam
    fprintf(yyout, "+--------+----------+----------------------+-----------------+\n");
    fprintf(yyout, "| LineNo | TokenNo  | Token Type           | Lexeme          |\n");
    fprintf(yyout, "+--------+----------+----------------------+-----------------+\n");

    // Type cheyyaam madi aanegil ithu uncomment cheythu use cheyyaam
    //fprintf(yyout, "%-10s %-10s %-20s %-15s\n", "Line No.", "Token No.", "Token Type", "Lexeme");
     
    yylex(); // start lexical analysis

    // Print footer line
    fprintf(yyout, "+--------+----------+----------------------+-----------------+\n");

    fclose(yyin);
    fclose(yyout);

    printf("Success!");
    return 0;
}
