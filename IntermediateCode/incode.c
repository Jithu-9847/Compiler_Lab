#include <stdio.h>
#include <ctype.h>
#include <string.h>

char expr[100];
char varStack[100][10];
char opStack[100];
int varTop = -1, opTop = -1, tempNum = 1;

// Function to get operator precedence
int prec(char op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    return 0;
}

// Function to generate three-address code
void genCode() {
    char b[10], a[10], op;

    strcpy(b, varStack[varTop--]);
    strcpy(a, varStack[varTop--]);
    op = opStack[opTop--];

    printf("T%d = %s %c %s\n", tempNum, a, op, b);

    char tempName[10];
    sprintf(tempName, "T%d", tempNum++);
    strcpy(varStack[++varTop], tempName);
}

int main() {
    printf("Enter expression (e.g., A=B+C*D or A=(B+C)*D): ");
    scanf("%s", expr);

    char resultVar[10];
    resultVar[0] = expr[0];
    resultVar[1] = '\0';

    for (int i = 2; expr[i] != '\0'; i++) {
        if (isalnum(expr[i])) {
            char var[2] = {expr[i], '\0'};
            strcpy(varStack[++varTop], var);
        } else if (expr[i] == '(') {
            opStack[++opTop] = '(';
        } else if (expr[i] == ')') {
            while (opTop >= 0 && opStack[opTop] != '(') {
                genCode();
            }
            if (opTop >= 0 && opStack[opTop] == '(')
                opTop--; // pop '('
        } else {
            while (opTop >= 0 && opStack[opTop] != '(' &&
                  prec(opStack[opTop]) >= prec(expr[i])) {
                genCode();
            }
            opStack[++opTop] = expr[i];
        }
    }

    while (opTop >= 0) {
        genCode();
    }

    printf("%s = T%d\n", resultVar, tempNum - 1);

    return 0;
}
