#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int z = 0, i = 0, j = 0, c = 0;
char a[50], ac[20], stk[50], act[10];
FILE *inp;

void check();

int main()
{
    puts("GRAMMAR is E->E+E \nE->E*E \nE->(E) \nE->id");

    inp = fopen("input.txt", "r");
    if (inp == NULL) {
        perror("Error opening file");
        return 1;
    }

    fscanf(inp, "%s", a);
    fclose(inp);

    c = strlen(a);
    strcpy(act, "SHIFT->");
    puts("Stack\tInput\tAction");

    for (i = 0, j = 0; j < c; i++, j++)
    {
        if (a[j] == 'i' && a[j + 1] == 'd')
        {
            stk[i] = a[j];
            stk[i + 1] = a[j + 1];
            stk[i + 2] = '\0';
            a[j] = a[j + 1] = ' ';
            printf("\n$%s\t%s$\t%sid", stk, a, act);
            check();
        }
        else
        {
            stk[i] = a[j];
            stk[i + 1] = '\0';
            a[j] = ' ';
            printf("\n$%s\t%s$\t%ssymbols", stk, a, act);
            check();
        }
    }
    return 0;
}

void check()
{
    strcpy(ac, "REDUCE TO E");

    for (z = 0; z < c; z++)
        if (stk[z] == 'i' && stk[z + 1] == 'd')
        {
            stk[z] = 'E';
            stk[z + 1] = '\0';
            printf("\n$%s\t%s$\t%s", stk, a, ac);
        }

    for (z = 0; z < c; z++)
        if (stk[z] == 'E' && stk[z + 1] == '+' && stk[z + 2] == 'E')
        {
            stk[z] = 'E';
            stk[z + 1] = stk[z + 2] = '\0';
            printf("\n$%s\t%s$\t%s", stk, a, ac);
            i -= 2;
        }

    for (z = 0; z < c; z++)
        if (stk[z] == 'E' && stk[z + 1] == '*' && stk[z + 2] == 'E')
        {
            stk[z] = 'E';
            stk[z + 1] = stk[z + 2] = '\0';
            printf("\n$%s\t%s$\t%s", stk, a, ac);
            i -= 2;
        }

    for (z = 0; z < c; z++)
        if (stk[z] == '(' && stk[z + 1] == 'E' && stk[z + 2] == ')')
        {
            stk[z] = 'E';
            stk[z + 1] = stk[z + 2] = '\0';
            printf("\n$%s\t%s$\t%s", stk, a, ac);
            i -= 2;
        }
}
