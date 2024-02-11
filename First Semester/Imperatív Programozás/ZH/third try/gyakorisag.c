#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>

#include "gyak.h"

#define MAX_HOSSZ 1024

void beolvas(FILE *file, size_t meret)
{
    Sor *sptr = malloc(sizeof(Sor) * meret);
    if(sptr == NULL)
    {
        fprintf(stderr, "Nincs eleg memoria");
        exit(1);
    }

    int N;
    while(true)
    {
        char sor[MAX_HOSSZ];
        int n = fscanf(file, "%s", sor);
        printf("%d\n", n);
        N=n;
    }
    printf("%d\n", N);
}

void felszabadit(Sor *sorok)
{
    free(sorok);
}
