#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include "fgk.h"

int main(int argc, char *argv[])
{
    if(argc <= 1)
    {
        beolvas();
    }
    else
    {
        for(int a=1; a<argc; a++)
        {
            char *file = argv[a];
            FILE *fptr = fopen(file, "r");

            if(fptr == NULL)
            {
                fprintf(stderr, "File opening unsuccessful!\n");
                continue;
            }
            else
            {
                beolvasFILEbol(fptr);
            }
            fclose(fptr);
        }
    }

    return 0;
}
