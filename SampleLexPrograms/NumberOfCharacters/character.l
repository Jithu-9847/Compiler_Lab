%{
int char_count = 0;
%}

%%

.       { char_count++; }   /* Count every character including spaces */
\n      ;

%%

int main() {
    printf("Enter a string (Ctrl+D to end):\n");
    //output kanaan Ctrl+D adiche pattu allathe athu code in error alla
    yylex();
    printf("Number of characters: %d\n", char_count);
    return 0;
}

int yywrap()
{
	return 1;
}