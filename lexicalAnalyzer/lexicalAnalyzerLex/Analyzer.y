%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyout;
extern FILE *yyin;

void yyerror(const char *s) {
    fprintf(yyout, "| %-6s | %-8s | %-20s | %-15s |\n","-","-","Syntax Error",s);
}

int yylex(void);
%}

%token KEYWORD IDENTIFIER NUMBER ASSIGNOP ARITHOP SEMICOLON LPAREN RPAREN LBRACE RBRACE OTHER

%%

program:
    statements
    ;

statements:
    statements statement
    | statement
    ;

statement:
    declaration SEMICOLON     { fprintf(yyout, "| %-6s | %-8s | %-20s | %-15s |\n","-","-","Declaration","-"); }
    | assignment SEMICOLON    { fprintf(yyout, "| %-6s | %-8s | %-20s | %-15s |\n","-","-","Assignment","-"); }
    | if_statement            { fprintf(yyout, "| %-6s | %-8s | %-20s | %-15s |\n","-","-","If statement","-"); }
    ;

declaration:
    KEYWORD IDENTIFIER
    ;

assignment:
    IDENTIFIER ASSIGNOP expr
    ;

expr:
    expr ARITHOP expr
    | NUMBER
    | IDENTIFIER
    ;

if_statement:
    KEYWORD LPAREN expr RPAREN LBRACE statements RBRACE
    ;

%%

int main() {
    // Open input file
    yyin = fopen("input.txt","r");
    if(!yyin) { printf("Cannot open input.txt\n"); return 1; }

    // Open output file
    yyout = fopen("output.txt","w");
    if(!yyout) { printf("Cannot open output.txt\n"); return 1; }

    //Table vrithikku venam ennu ondengile thazhathe use cheyyaam
    fprintf(yyout, "+--------+----------+----------------------+-----------------+\n");
    fprintf(yyout, "| LineNo | TokenNo  | Token Type           | Lexeme          |\n");
    fprintf(yyout, "+--------+----------+----------------------+-----------------+\n");

    // Type cheyyaam madi aanegil ithu uncomment cheythu use cheyyaam
    //fprintf(yyout, "%-10s %-10s %-20s %-15s\n", "Line No.", "Token No.", "Token Type", "Lexeme");
     
    // Start parsing
    yyparse();

    // Print table footer
    fprintf(yyout, "+--------+----------+----------------------+-----------------+\n");

    fclose(yyin);
    fclose(yyout);

    printf("Analysis completed. Check output.txt\n");
    return 0;
}
