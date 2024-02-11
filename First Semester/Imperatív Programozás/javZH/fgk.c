#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>

#include "fgk.h"

#define MAX_HOSSZ 1024

bool szam(char* current)
{
    bool szam = false;
    size_t i=0;
    while(i<strlen(current))
    {
        if(isdigit(current[i]))
        {
            szam = true;
        }
        else
        {
            szam = false;
            break;
        }
        i++;
    }
    return szam;
}

char* atalakit(int n, char* romaiSzam)
{
    int arab[7] = {1, 5, 10, 50, 100, 500, 1000};
    char romai[8] = {'I', 'V', 'X', 'L', 'C', 'D', 'M','\0'};

    int db = 0;
    while(n != 0)
    {
        if (n >= arab[6])
        {
        romaiSzam[db] = romai[6];
        db++;
        n -= arab[6];
        }

        else if (n >= arab[6]-arab[5])
        {
            romaiSzam[db] = romai[5];
            romaiSzam[db+1] = romai[6];
            db+=2;
            n -= arab[6]-arab[5];
        }

        else if (n >= arab[5])
        {
            romaiSzam[db] =romai[5];
            db++;
            n -= arab[5];
        }

        else if (n >= arab[5]-arab[4])
        {
            romaiSzam[db] = romai[4];
            romaiSzam[db+1] =romai[5];
            db+=2;
            n -= arab[5]-arab[4];
        }

        else if (n >= arab[4])
        {
            romaiSzam[db] = romai[4];
            db++;
            n -= arab[4];
        }

        else if (n >= arab[4]-arab[2])
        {
            romaiSzam[db] = romai[2];
            romaiSzam[db+1] = romai[4];
            db+=2;
            n -= arab[4]-arab[2];
        }

        else if (n >= arab[3])
        {
            romaiSzam[db] = romai[3];
            db++;
            n -= arab[3];
        }

        else if (n >= arab[3]-arab[2])
        {
            romaiSzam[db] = romai[2];
            romaiSzam[db+1] = romai[3];
            db+=2;
            n -= arab[3]-arab[2];
        }

        else if (n >= arab[2])
        {
            romaiSzam[db] = romai[2];
            db++;
            n -= arab[2];
        }

        else if (n >= arab[2]-arab[0])
        {
            romaiSzam[db] = romai[0];
            romaiSzam[db+1] = romai[2];
            db+=2;
            n -= arab[2]-arab[0];
        }

        else if (n >= arab[1])
        {
            romaiSzam[db] =romai[1];
            db++;
            n -= arab[1];
        }

        else if (n >= arab[1]-arab[0])
        {
            romaiSzam[db] = romai[0];
            romaiSzam[db+1] = romai[1];
            db+=2;
            n -= arab[1]-arab[0];
        }

        else if (n >= arab[0])
        {
            romaiSzam[db] = romai[0];
            db++;
            n -= arab[0];
        }
    }
    return romaiSzam;
}

void felszabadit(int index, char *a[], char *b)
{
    for (int i=0; i<index; ++i)
	{
		free(a[i]);
	}
	free(a);
	free(b);
}

void beolvas()
{
    char** new_t=calloc(8, sizeof(char*));
	if (new_t==NULL)
		{
			fprintf(stderr, "Memory allocation failed!\n");
			exit(2);
		}
	char* current=malloc(sizeof(char)*MAX_HOSSZ);
	if (current==NULL)
		{
			fprintf(stderr, "Memory allocation failed!\n");
			exit(2);
		}
	int index=0;

	do {
		scanf("%s",current);

        char romaiSzam[MAX_HOSSZ];
		bool tenylegSzam = szam(current);
		if(!tenylegSzam)
            printf("%s: wrong input!\n", current);
        else
        {
            int n;
            sscanf(current, "%d", &n);
            new_t[index] = atalakit(n, romaiSzam);
            index++;
        }

		char** current_ptr=realloc(new_t, sizeof(char*)*(index+1));
	       	if (current_ptr !=0)
		{
			new_t=current_ptr;
		}
		else
		{
			fprintf(stderr, "Memory allocation failed!\n");
			exit(2);
		}
	} while ((fgets(current,MAX_HOSSZ,stdin))!=NULL);;

	printf("%s\n", new_t);

    felszabadit(index, new_t, current);
}

void beolvasFILEbol(FILE *file)
{
    char** new_t=calloc(8, sizeof(char*));
	if (new_t==NULL)
	{
		fprintf(stderr, "Memory allocation failed!\n");
		exit(2);
	}
	char* current=malloc(sizeof(char)*MAX_HOSSZ);
	if (current==NULL)
	{
		fprintf(stderr, "Memory allocation failed!\n");
		exit(2);
	}
	int index=0;

	do {
		fscanf(file,"%s",current);

		char romaiSzam[MAX_HOSSZ];
		bool tenylegSzam = szam(current);
		if(!tenylegSzam)
            printf("%s: wrong input!\n", current);
        else
        {
            int n;
            sscanf(current, "%d", &n);
            new_t[index] = atalakit(n, romaiSzam);
            index++;
        }

		char** current_ptr=realloc(new_t, sizeof(char*)*(index+1));
		if (current_ptr !=0)
		{
			new_t=current_ptr;
		}
		else
		{
			fprintf(stderr, "Memory allocation failed!\n");
			exit(2);
		}
	} while ((fgets(current,MAX_HOSSZ,file))!=NULL);

	printf("%s\n", new_t);

	felszabadit(index, new_t, current);
}


