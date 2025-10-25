%{
#include "Valid.tab.h"
%}
%%

[a-zA-Z_][a-zA-Z0-9_]*   { yylval = 0; return IDENTIFIER; }  
[ \t\n]+                  ; 
.                         { return yytext[0]; }
%%

int yywrap() { return 1; }
