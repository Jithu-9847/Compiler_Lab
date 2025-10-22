%{
#include "calc.tab.h" //oru karyam shredhikkanam yacc inte program run cheyyumbol oru pakshe generate aakunnathu 'y.tab.h' allengil 'filename.tab.h' aayirikkum.so aa file inte name venam ee #include inte kodukkendathu, karanam vere onnum kondu alle bison inte version anusarichu ouput file maarum sookshichonam 
#include <stdio.h>
extern int yylval;
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]       { return yytext[0]; }
\n              { return 0; }     // stop on newline
[ \t]+          ;                 // ignore spaces
.               { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
