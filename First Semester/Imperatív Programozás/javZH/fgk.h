#ifndef FUGGVENYEK_H
#define FUGGVENYEK_H

#include <stdio.h>
#include <stdlib.h>

bool szam(char* current);
char* atalakit(int n, char* romaiSzam);
void felszabadit(int index, char *a[], char *b);
void beolvasFILEbol(FILE *file);
void beolvas();

#endif
