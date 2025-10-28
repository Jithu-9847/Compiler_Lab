#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// small letters mathrame work aakatholle capital letters work aakilla athupole
// a=2+4 and a=2+b ithupolathe conditions work aakilla ketto ninggal aanu input kodukkunnathu engil kuzhapam illa

int main() {
    FILE *fp = fopen("input.txt", "r");
    if (!fp) {
        printf("Cannot open input.txt\n");
        return 1;
    }

    int n;
    fscanf(fp, "%d\n", &n); // read number of statements

    long val[26] = {0};
    int isConst[26] = {0};

    char line[50];
    for (int i = 0; i < n; i++) {
        if (!fgets(line, sizeof(line), fp)) break;
        line[strcspn(line, "\n")] = 0; // remove newline

        char lhs = line[0];
        char *rhs = &line[2];

        if (isdigit(rhs[0])) { // constant assignment
            val[lhs - 'a'] = atol(rhs);
            isConst[lhs - 'a'] = 1;
            printf("%c = %ld\n", lhs, val[lhs - 'a']);
        } else { // expression like b=a+3 or c=z*a
            char a = rhs[0];
            char op = rhs[1];
            char b = rhs[2];

            long rightVal = -1;
            if (isdigit(b)) rightVal = atol(&rhs[2]);
            else if (isConst[b - 'a']) rightVal = val[b - 'a'];

            if (isConst[a - 'a'] && rightVal != -1) { // can evaluate
                long result = 0;
                switch(op){
                    case '+': result = val[a - 'a'] + rightVal; break;
                    case '-': result = val[a - 'a'] - rightVal; break;
                    case '*': result = val[a - 'a'] * rightVal; break;
                    case '/': result = val[a - 'a'] / rightVal; break;
                }
                val[lhs - 'a'] = result;
                isConst[lhs - 'a'] = 1;
                printf("%c = %ld\n", lhs, result);
            } else { // cannot fully evaluate
                printf("%c = %c %c ", lhs, a, op);
                if (rightVal != -1) printf("%ld\n", rightVal);
                else printf("%c\n", b);
            }
        }
    }

    fclose(fp);
    return 0;
}

what is the problem in this code
