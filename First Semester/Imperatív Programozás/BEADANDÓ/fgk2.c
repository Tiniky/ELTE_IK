#include "REVERSE.H"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int sor_hossz(char sor[])
{
	int hossz = 0;
	while ( sor[hossz] != '\0' )
	{
		hossz++;
	}

	return hossz;
}

void reverse(char sor[])
{
	int hossz = sor_hossz(sor);
	for(int i=hossz-1; i>=0; i--)
	{
		printf("%c", sor[i]);
	}

	printf("\n");
}

int sor_darab(char *file)
{
	FILE* fptr;
        fptr = fopen(file,"r");

        if (fptr == NULL)
        {
	 	//printf("NULLAAAA mit akarsz\n");	
		return 0;
	}

	int aktualis=0;
	int db=1;
	
	while(!feof(fptr))
	{
		aktualis=fgetc(fptr);
		if(aktualis == '\n')
		{
			db++;
		}
	}
	fclose(fptr);
	//printf("átment a db\n");
	return db;
}

void reverse2(int argc, char *argv[])
{
	for (int a=1; a<argc; a++)
	{
		FILE* fptr;
        	char *file = argv[a];
        	fptr = fopen(file,"r");

        	if (fptr == NULL)
        	{
                	fprintf(stderr, "File opening unsuccesful!\n");
                	exit(1);
        	}

        	char sor[1024];
        	int aktualis;
        	int karDB;
		int sorDB = sor_darab(argv[a]) - 1;
		
        	fseek(fptr, 0, SEEK_END);
        	while (ftell(fptr) > -1)
        	{
			fseek(fptr, -2, SEEK_CUR);
                	if(ftell(fptr) <= 2)
                        	break;

                	karDB = 0;

			aktualis = fgetc(fptr);

                	while(aktualis != '\n')
                	{
                        	sor[karDB++] = aktualis;
                        	if(ftell(fptr) < 2)
                                	break;

                        	fseek(fptr, -2, SEEK_CUR);
                        	aktualis = fgetc(fptr);
                	}
			
			printf("%d ", sorDB);
                       	sorDB--;

			//reverse(sor);

			for(int i=0; i<karDB; i++)
               		for(int i=karDB -1; i>=0; i--)
			{
                       		printf("%c", sor[i]);
                	}
                	printf("\n");
        	}
        	fclose(fptr);
	}
}
