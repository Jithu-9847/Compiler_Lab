%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

FILE *text;
int vowels = 0, consonants = 0, words = 0, lines = 0, letters = 0;

int isVowel(char c)
{
    c = tolower(c);
    return (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u');
}

void processFile()
{
    char ch, prev = ' ';
    while ((ch = fgetc(text)) != EOF)
    {
        // count lines
        if (ch == '\n')
            lines++;



        // count letters, vowels, consonants
        if (isalpha(ch)) {
            letters++;	//alphabets mathrame count cheyyu letters il , ella characters um count cheyyanam engil ithu eduthu if nu purathu ittaal mathi
            if (isVowel(ch))
                vowels++;
            else
                consonants++;
        }

        // count words (when space/newline/tab follows a letter)
        if ((ch == ' ' || ch == '\n' || ch == '\t') && isalpha(prev))
            words++;

        prev = ch;
    }

    // if file ends with a letter, count last word
    if (isalpha(prev))
        words++;
}
%}

%%

[1]     { printf("Total vowels: %d\n", vowels); }
[2]     { printf("Total consonants: %d\n", consonants); }
[3]     { printf("Total words: %d\n", words); }
[4]     { printf("Total lines: %d\n", lines); }
[5]     { printf("Total letters: %d\n", letters); }
[6]     { printf("Exiting...\n"); exit(0); }
\n      { /* ignore newlines */ }
.       { printf("Invalid choice!\n"); }

%%

int main()
{
    text = fopen("input.txt", "r");
    if (!text) {
        printf("Error: cannot open input.txt\n");
        return 1;
    }

    processFile();
    fclose(text);

        printf("\n--- MENU ---\n");
        printf("1 - Display Vowels\n");
        printf("2 - Display Consonants\n");
        printf("3 - Display Words\n");
        printf("4 - Display Lines\n");
        printf("5 - Display Letters\n");
        printf("6 - Exit\n");
        printf("\nEnter your choice: ");
        yylex();
    return 0;
}

int yywrap() { return 1; }
