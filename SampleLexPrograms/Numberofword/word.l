%{
#include<stdio.h>
#include<stdlib.h>
int word =0;
%}
%%
		
[a-zA-Z]+		{word++;}
[ \t\n]			{}
.			      ;
%%
int main(){
	printf("Enter a string: ");
	yylex();
	printf("\nNumber od words = %d\n",word);	//String enter cheythit ctrl+d cheythale out kanan pattu
	return 0;
}
int yywrap(){return 1;}
