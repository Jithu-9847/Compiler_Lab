#include <stdio.h>
#include <stdlib.h>

#define MAX 10

int n;                         // number of states
int transitions[MAX][MAX];     // epsilon-transition matrix
int visited[MAX];              // visited states tracker

// Recursive DFS function for epsilon closure
void epsilon_closure(int state) {
    visited[state] = 1;

    for (int i = 0; i < n; i++) {
        if (transitions[state][i] && !visited[i]) {
            epsilon_closure(i);
        }
    }
}

int main() {
    int i, j;
    printf("Enter number of states in the NFA: ");
    scanf("%d", &n);

    printf("\nEnter epsilon-transition matrix (1 for ε-transition, 0 otherwise)\n");
    printf("Example: if q0 --ε--> q1, then enter 1 at [q0][q1]\n\n");

    // Print header row for clarity
    printf("      ");
    for (i = 0; i < n; i++) printf("q%d ", i);
    printf("\n");

    for (i = 0; i < n; i++) {
        printf("q%d -> ", i);
        for (j = 0; j < n; j++) {
            scanf("%d", &transitions[i][j]);
        }
    }

    printf("\n----- Epsilon Closures -----\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++)
            visited[j] = 0;

        epsilon_closure(i);

        printf("ε-closure(q%d) = { ", i);
        for (j = 0; j < n; j++) {
            if (visited[j])
                printf("q%d ", j);
        }
        printf("}\n");
    }

    return 0;
}