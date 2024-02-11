#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#include "gyak.h"

int main(int argc, char *argv[])
{
    size_t meret = 4;
    Sor *sorok;
    int egyedi;

    if(argc <= 1)
    {
        beolvas(stdin, meret);

    }
    else
    {
        for(int i=1; i<argc; i++)
        {
            char *file = argv[i];
            FILE *fptr = fopen(file, "r");

            if(fptr == NULL)
            {
                fprintf(stderr, "Nem sikerult megnyitni a file-t");
                continue;
            }

            beolvas(fptr, meret);

            fclose(fptr);
        }
    }
    felszabadit(sorok);
    return 0;
}
