#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>

#include "gyak.h"

#define MAX_HOSSZ 1024

void sorFelszabadit(Sor *sorok, int *hossz)
{
    for(int i=0; i<(*hossz); i++)
    {
        free(sorok[i].szoveg);
    }
    free(sorok);
}

void toLowerAlakit(char *a, char *kisA)
{
    for(int i=0; i<MAX_HOSSZ; i++)
    {
        kisA = '\0';
    }

    for(int i=0; i<MAX_HOSSZ; i++)
    {
        char x = a[i];
        if(x == '\0')
            break;

        kisA[i] = tolower(x);
    }
}

int nemTeszKulonbseget(char *a, char *b)
{
    char kisA[MAX_HOSSZ];
    toLowerAlakit(a, kisA);
    char kisB[MAX_HOSSZ];
    toLowerAlakit(b, kisB);

    return strcmp(kisA, kisB);
}

void csere(Sor *a, Sor *b)
{
    Sor temp = *a;
    *a = *b;
    *b = temp;
}

void rendez(Sor *tomb, int *egyediDB)
{
    for(int i=0; i<(*egyediDB); i++)
    {
        for(int j=0; j<(*egyediDB); j++)
        {
            if(tomb[i].db < tomb[j].db)
            {
                csere(&tomb[i], &tomb[j]);
            }
        }
    }
}

Sor *foglaldLe(Sor *tomb, int *aktualisMeret)
{
    int ujMeret = (*aktualisMeret) * 2;
    *aktualisMeret = ujMeret;
    Sor *ujTomb = realloc(tomb, sizeof(Sor) * ujMeret);
    if(ujTomb == NULL)
    {
        fprintf(stderr, "Nincs eleg memoria");
        sorFelszabadit(tomb, aktualisMeret);
        exit(1);
    }
    return ujTomb;
}

bool sorKeres(Sor *sorok, int *egyediDB, char *keresettErtek, int *index)
{
    bool talalt = false;

    for(int i=0; i<(*egyediDB); i++)
    {
        Sor sor = sorok[i];
        if(nemTeszKulonbseget(sor.szoveg, keresettErtek) == 0)
        {
            talalt = true;
            *index = i;
        }
    }
    return talalt;
}

void sorHozzaad(Sor *sorok, int *egyediDB, int *sorokHossz, char *ertek)
{
    (*egyediDB)++;
    if(*egyediDB > *sorokHossz)
    {
        sorok = foglaldLe(sorok, sorokHossz);
    }

    unsigned int hossz = strlen(ertek) + 1;

    Sor l;
    l.szoveg = malloc(hossz);
    l.db = 1;

    memcpy(l.szoveg, ertek, hossz);

    sorok[(*egyediDB) - 1] = l;
}

int osszegez(FILE *file, Sor **matrix)
{
    int meret = 4;
    int egyediDB = 0;

    Sor *sorok = malloc(sizeof(Sor) * meret);
    if(sorok == NULL)
    {
        fprintf(stderr, "Nincs eleg memoria");
        exit(1);
    }

    while(true)
    {
        char sor[MAX_HOSSZ];
        int index = fscanf(file, "%s", sor);

        if(index < 1 || feof(file))
            break;

        int talaltIndex = 0;
        bool talalt = sorKeres(sorok, &egyediDB, sor, &talaltIndex);

        if(talalt)
        {
            sorok[talaltIndex].db++;
        }
        else
        {
            sorHozzaad(sorok, &egyediDB, &meret, sor);
        }
    }

    *matrix = sorok;
    return egyediDB;
}

void kiir(Sor *sorok, int db)
{
    for(int i=0; i<db; i++)
    {
        Sor sor = sorok[i];
        printf("%d %s", sor.db, sor.szoveg);
    }
}
