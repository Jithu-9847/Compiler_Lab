%{
#include<stdio.h>
#include<stdlib.h>
int count =0;
%}
%%
[aeiouAEIOU]		{count++;}
[ \t\n]			    {}
.			          ;
%%
int main(){
	printf("Enter a string: ");
	yylex();
	printf("\n%d\n",count);	//String enter cheythit ctrl+d cheythale out kanan pattu
	return 0;
}
int yywrap(){return 1;}
