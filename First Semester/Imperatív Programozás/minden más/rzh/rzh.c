#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n;
    scanf("%d", &n);

    int summ = 0;

    for (int i=1; i<n; i++)
    {
        if (i%2==0)
        {
            printf(i);
            summ = summ + i;
        }
    }

    printf (summ);
}
