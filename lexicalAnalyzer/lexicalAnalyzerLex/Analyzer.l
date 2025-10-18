%{
#include "Analyzer.tab.h" //oru karyam shredhikkanam yacc inte program run cheyyumbol oru pakshe generate aakunnathu 'y.tab.h' allengil 'filename.tab.h' aayirikkum.so aa file inte name venam ee #include inte kodukkendathu, karanam vere onnum kondu alle bison inte version anusarichu ouput file maarum sookshichonam
#include <stdio.h>
#include <string.h>

FILE *yyout;
int line_no = 1;
int token_no = 1;
extern FILE *yyin;

%}

%%

[ \t]+                ;          // skip spaces
\n                    { line_no++; }

"int"|"float"|"if"|"else"|"return" {
    fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "KEYWORD", yytext);
    return KEYWORD;
}

[a-zA-Z_][a-zA-Z0-9_]* {
    fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "IDENTIFIER", yytext);
    return IDENTIFIER;
}

[0-9]+                 {
    fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "NUMBER", yytext);
    return NUMBER;
}

"="                    { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "ASSIGN", yytext); return ASSIGNOP; }
"\+"|"-"|"*"|"/"       { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "ARITH", yytext); return ARITHOP; }

";"                    { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "SEMICOLON", yytext); return SEMICOLON; }
"("                    { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "LPAREN", yytext); return LPAREN; }
")"                    { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "RPAREN", yytext); return RPAREN; }
"{"                    { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "LBRACE", yytext); return LBRACE; }
"}"                    { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "RBRACE", yytext); return RBRACE; }

.                      { fprintf(yyout, "| %-6d | %-8d | %-20s | %-15s |\n", line_no, token_no++, "OTHER", yytext); return OTHER; }

%%

int yywrap() { return 1; }
