%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]+      { /* ignore whitespace */ }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }
"\n"        { return '\n'; }

.           { return yytext[0]; }

%%

int yywrap() { return 1; }
