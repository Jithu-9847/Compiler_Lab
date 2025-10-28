#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>

struct expr{
    char op[5],arg1[5],arg2[5],res[5];
    int flag;
}arr[10];
int n;

void change(int p,char *res)
{
    for(int i=p+1;i<n; i++)
    {
        if(strcmp(arr[p].res,arr[i].arg1)==0)
            strcpy(arr[i].arg1,res);
        else if(strcmp(arr[p].res,arr[i].arg2)==0)
            strcpy(arr[i].arg2,res);
    }
}

void input()
{
    printf("Enter the no of terms: ");
    scanf("%d",&n);
    printf("Enter the terms as Quatraples:\nop arg1 arg2 res\n");
    for(int i=0;i<n;i++)
    {
        scanf("%s",arr[i].op);
        scanf("%s",arr[i].arg1);
        scanf("%s",arr[i].arg2);
        scanf("%s",arr[i].res);
        arr[i].flag=0;
    }
}

void constant() {
    int a, b, res;
    char temp_res[5];

    for (int i = 0; i < n; i++) 
    {
        if (arr[i].op[0] == '=') 
        {
            strcpy(temp_res, arr[i].arg1);
            arr[i].flag = 1;
            change(i, temp_res);
        }
        else if (isdigit(arr[i].arg1[0]) && isdigit(arr[i].arg2[0])) 
        {
            a = atoi(arr[i].arg1);
            b = atoi(arr[i].arg2);
            switch (arr[i].op[0]) 
            {
                case '+': res = a + b; break;
                case '-': res = a - b; break;
                case '*': res = a * b; break;
                case '/': res = a / b; break;
                default: continue;
            }
            sprintf(temp_res, "%d", res);
            arr[i].flag = 1;
            change(i, temp_res);
        }
    }
}


void output()
{
    printf("\nFinal optimized expressions:\n");
    for (int i = 0; i < n; i++) {
        if (arr[i].flag) {
            // Expression was folded — show final constant value
            printf("= %s %s\n", arr[i].arg1, arr[i].res);
        } else {
            // Expression still needs computation
            printf("%s %s %s %s\n", arr[i].op, arr[i].arg1, arr[i].arg2, arr[i].res);
        }
    }
}


int main()
{
    input();
    constant();
    output();
    return 0;
}
