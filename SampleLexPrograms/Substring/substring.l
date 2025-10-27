%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
char s[20],sub[10];
%}
%%

[a-z]+		{
			int pos=strstr(s,yytext)-s;
			for(int i=pos;i<pos+strlen(yytext);i++){
				s[i]=toupper(s[i]);
			}
			
		}
[ \t]		{}
.		;

%%
int main() {
    printf("Enter the string: ");
    scanf("%s",s);
    printf("Enter the substring you wanna change: ");
    yylex();
    printf("%s",s);
    return 0;
}
int yywrap() { return 1; }
