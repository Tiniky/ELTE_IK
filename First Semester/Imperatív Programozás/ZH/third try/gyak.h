#ifndef GYAKORISAG_H
#define GYAKORISAG_H

#include <stdio.h>
#include <stdbool.h>

typedef struct{
    char *szoveg;
    int db;
} Sor;

void beolvas(FILE *file, size_t meret);

void felszabadit(Sor *sorok);

#endif
