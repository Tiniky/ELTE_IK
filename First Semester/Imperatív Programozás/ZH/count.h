#ifndef COUNT_H
#define COUNT_H

#include <stdio.h>

typedef struct {
	char *sor[1024];
	int db;
} sorok;


int sorDarab(char *file);
void beolvasTombbe (char *argv[], sorok *sor, int hossz);
/*void printTomb (char *argv[], char **lines);
void megszamol(char **lines, int hossz);*/

#endif
