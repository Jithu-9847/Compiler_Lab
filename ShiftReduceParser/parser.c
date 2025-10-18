#include <stdio.h>
#include <string.h>

int main() {
    char input[100], stack[100] = "";
    char *rules[] = {"2E2", "3E3", "4"};
    int top = -1, index = 0;

    printf("Input string: ");
    scanf("%s", input);
    strcat(input, "$");

    printf("\nStack\t\tAction\n");
    printf("-------------------------\n");

    while (1) {
        int reduced = 0;
        for (int i = 0; i < 3; i++) {
            char *pos = strstr(stack, rules[i]);
            if (pos) {
                printf("%s\tReduce by %s\n", stack, rules[i]);
                // Replace matched rule with 'E'
                int start = pos - stack;
                stack[start] = 'E';
                // shift rest of string left
                strcpy(&stack[start + 1], &stack[start + strlen(rules[i])]);
                top = strlen(stack) - 1;
                reduced = 1;
                break;
            }
        }

        if (!reduced) {
            if (input[index] == '$') break;
            stack[++top] = input[index++];
            stack[top + 1] = '\0';
            printf("%s\tShift\n", stack);
        }
    }

    printf("-------------------------\n");
    printf("%s\n", strcmp(stack, "E") == 0 ? "String Accepted" : "String Rejected");
    return 0;
}
