#ifndef GYAKORISAG_H
#define GYAKORISAG_H

#include <stdio.h>
#include <stdbool.h>

typedef struct{
    char *szoveg;
    int db;
} Sor;

void toLowerAlakit(char *a, char *kisA);
int nemTeszKulonbseget(char *a, char *b);

Sor *foglaldLe(Sor *tomb, int *aktualisMeret);
bool sorKeres(Sor *sorok, int *egyediDB, char *keresettErtek, int *index);
void sorHozzaad(Sor *sorok, int *egyediDB, int *sorokHossz, char *ertek);
void sorFelszabadit(Sor *sorok, int *hossz);

int osszegez(FILE *file, Sor **matrix);
void kiir(Sor *sorok, int db);

void rendez(Sor *tomb, int *egyediDB);
void csere(Sor *a, Sor *b);

#endif
