#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "count.h"

int sorDarab(char *file)
{
	int aktualis=0;
        int db=1;

	FILE* fptr;
        fptr = fopen(file,"r");

        if (fptr == NULL)
        {
		return 0;
	}

	while(!feof(fptr))
	{
		aktualis=fgetc(fptr);
		if(aktualis == '\n')
		{
			db++;
		}
	}
	fclose(fptr);
	return db;
}

void beolvasTombbe (char *argv[], sorok *sor, int hossz){
	FILE *fptr;
	char *file = argv[1];
	fptr = fopen(file,"r");

	if(fptr == NULL)
	{
		fprintf(stderr, "Nem sikerült megnyitni a file-t :c\n");
		exit(1);
	}

	int db = 0;
	char lines[hossz];

	while (!feof(fptr)) {
		char aktualis;
		if(hossz < db)
			hossz = hossz *2;

            aktualis=fgetc(fptr);
            int karakterDB = 0;
            while(aktualis != '\n')
            {
                sor->sor[karakterDB] = &aktualis;
                karakterDB++;
            }

        //lines[db] = szo->szo;
		db++;
	}
}

/*void printTomb (char *argv[], char **lines) {
	int sorDB = sorDarab(argv[1]);
	for(int i = 0; i<sorDB; i++)
	{
        	for(int j=0; j<1024; j++)
		{
			printf("%s ", lines[i][j]);
		}

		printf("\n");
    }
    printf("\n");
}*/


