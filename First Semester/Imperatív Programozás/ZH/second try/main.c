#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#include "gyak.h"

int main(int argc, char *argv[])
{
    if(argc <= 1)
    {
        Sor *sorok;
        int egyedi = osszegez(stdin, &sorok);

        rendez(sorok, &egyedi);
        kiir(sorok, egyedi);
        sorFelszabadit(sorok, &egyedi);

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

            Sor *sorok;
            int egyedi = osszegez(fptr, &sorok);

            rendez(sorok, &egyedi);
            kiir(sorok, egyedi);
            sorFelszabadit(sorok, &egyedi);

            fclose(fptr);
        }
    }

    return 0;
}
