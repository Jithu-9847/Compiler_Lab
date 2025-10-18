%{
// Ithu chumma itta oru program aane just complex aayittu olla code eggane cheyyaam ennu kaanikkan aane
// Thallaruthu 😅
 
#include <stdio.h>
#include <string.h>
#include <ctype.h>

char name1[50], name2[50];

// Remove common letters and return count
int countRemaining(char n1[], char n2[]) {
    int len1 = strlen(n1), len2 = strlen(n2), count = 0;
    int used[100] = {0};
    for (int i = 0; i < len1; i++) {
        int found = 0;
        for (int j = 0; j < len2; j++) {
            if (tolower(n1[i]) == tolower(n2[j]) && !used[j]) {
                used[j] = 1; found = 1; break;
            }
        }
        if (!found) count++;
    }
    for (int i = 0; i < len2; i++)
        if (!used[i]) count++;
    return count;
}

// Determine FLAMES result
char* flamesResult(int count) {
    char flames[] = "FLAMES"; 
    int len = 6, index = 0;
    while (len > 1) {
        index = (count + index - 1) % len;
        for (int i = index; i < len - 1; i++)
            flames[i] = flames[i + 1];
        len--;
    }
    switch (flames[0]) {
        case 'F': return "Friendship";
        case 'L': return "Love";
        case 'A': return "Affection";
        case 'M': return "Marriage";
        case 'E': return "Enemy";
        case 'S': return "Siblings";
    }
    return "";
}

// Function to process input "firstname:secondname"
void processNames(char *input) {
    char *colon = strchr(input, ':');
    if (!colon) { printf("Invalid input format\n"); return; }
    int pos = colon - input;
    strncpy(name1, input, pos);
    name1[pos] = '\0';
    strcpy(name2, colon + 1);
    printf("First Name: %s\nSecond Name: %s\n", name1, name2);
    int count = countRemaining(name1, name2);
    printf("\nFLAMES Result: %s\n", flamesResult(count));
}
%}

%%

[a-zA-Z]+:[a-zA-Z]+    { processNames(yytext); }

[ \t\n]+               ;  // skip whitespace/newlines
.                      { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    printf("Enter names in format firstname:secondname\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }
