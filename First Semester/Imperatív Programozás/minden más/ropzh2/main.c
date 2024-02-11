#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 10

void printArray(int array[], const int size);

int main()
{
    const int N = 100;

    int max;
    int min;
    for (int i = 0; i< N; i++)
    {
        if (i > max)
        {
            max = i;
        }
        else if (i < min)
        {
            min = i;
        }
    }

    for (int i = 0; i< N; i++)
    {
        if (i == max)
        {
            printf("%d, ", min);
        }
        else if (i == min)
        {
            printf("%d, ", max);
        }
        else
        {
            printf("%d, ", i);
        }
    }
    printf("\n");

}
