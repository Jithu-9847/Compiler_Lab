%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include <ctype.h>
%}
%%

[1]		{
			printf("Enter the String You want to UpperCase:");
			char s[20];
			scanf("%s",s);
			for(int i=0;i<strlen(s);i++)
				printf("%c",toupper(s[i]));
			printf("\nEnter the option(1=UpperCase,2=LowerCase,Ctrl+D to terminate)\n");
		}
		
[2]		{
			printf("Enter the String You want to LowerCase:");
			char s[20];
			scanf("%s",s);
			for(int i=0;i<strlen(s);i++)
				printf("%c",tolower(s[i]));
			printf("\nEnter the option(1=UpperCase,2=LowerCase,Ctrl+D to terminate)\n");
		}

%%
int main() {
     
    printf("Enter the option(1=UpperCase,2=LowerCase,Ctrl+D to terminate)\n");
    yylex();
     
    return 0;
}
int yywrap() { return 1; }
