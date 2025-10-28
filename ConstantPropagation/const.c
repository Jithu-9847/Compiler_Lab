#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

struct expr {
    char op[5], arg1[10], arg2[10], res[10];
    int flag;
} arr[20];

int n;
int value[26];
int isConst[26];

int getVarIndex(char c) {
    return c - 'a';
}

int isNumber(char *s) {
    return isdigit(s[0]);
}

void propagate(int p, char *newVal) {
    for (int i = p + 1; i < n; i++) {
        if (strcmp(arr[p].res, arr[i].arg1) == 0)
            strcpy(arr[i].arg1, newVal);
        if (strcmp(arr[p].res, arr[i].arg2) == 0)
            strcpy(arr[i].arg2, newVal);
    }
}

void input() {
    printf("Enter number of statements: ");
    scanf("%d", &n);

    printf("Enter statements (op arg1 arg2 res):\n");
    for (int i = 0; i < n; i++) {
        scanf("%s %s %s %s",
              arr[i].op, arr[i].arg1, arr[i].arg2, arr[i].res);
        arr[i].flag = 0;
    }
    memset(isConst, 0, sizeof(isConst));
}

void constantProp() {
    for (int i = 0; i < n; i++) {
        char *op = arr[i].op;
        char *a1 = arr[i].arg1;
        char *a2 = arr[i].arg2;
        char *r  = arr[i].res;

        // Assignment
        if (op[0] == '=') {
            if (isNumber(a1)) {
                int idx = getVarIndex(r[0]);
                value[idx] = atoi(a1);
                isConst[idx] = 1;
            }
            propagate(i, a1);
            arr[i].flag = 1;
        }

        // Constant folding if both numbers
        else if (isNumber(a1) && isNumber(a2)) {
            int a = atoi(a1);
            int b = atoi(a2);
            int idx = getVarIndex(r[0]);

            switch (op[0]) {
                case '+': value[idx] = a + b; break;
                case '-': value[idx] = a - b; break;
                case '*': value[idx] = a * b; break;
                case '/': value[idx] = (b != 0) ? a / b : 0; break;
            }

            isConst[idx] = 1;
            char temp[10];
            sprintf(temp, "%d", value[idx]);
            propagate(i, temp);

            arr[i].flag = 1;
        }
    }
}

void outputFinal() {
    printf("\nFinal Output (After Constant Propagation):\n");

    for (int i = 0; i < n; i++) {
        int idx = getVarIndex(arr[i].res[0]);

        if (arr[i].op[0] == '=') {
            if (isConst[idx])
                printf("%s = %d\n", arr[i].res, value[idx]);
            else
                printf("%s = %s\n", arr[i].res, arr[i].arg1);
        } else {
            if (isConst[idx])
                printf("%s = %d\n", arr[i].res, value[idx]);
            else
                printf("%s = %s %c %s\n",
                       arr[i].res, arr[i].arg1, arr[i].op[0], arr[i].arg2);
        }
    }
}

int main() {
    input();
    constantProp();
    outputFinal();
    return 0;
}
