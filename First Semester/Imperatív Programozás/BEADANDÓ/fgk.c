#include "reverse.h"
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

void reverse_sorrend(int argc, char *argv[])
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

        	char *buffer;
		char sor[1024];
		
		int kezd = 0;
		fseek(fptr, 0, SEEK_END);
		int meret = ftell(fptr);
		
		int sorok = sor_darab(argv[a]) -1;
		int index;
		
		int megvolt = 0;
		buffer = malloc((meret+1) * sizeof(char));
		megvolt = 1;

		if (megvolt == 0)
		{
			fprintf(stderr, "Memory allocation failed!\n");
                        exit(1);
		}

		int i;
		for (i=0; i<meret; i++)
		{
			fseek(fptr, meret-1-i, SEEK_SET);
			buffer[i] = fgetc(fptr);

			if(buffer[i] == 10)
			{
				if(i!=0)
				{
					index = 0;
					for(int j=i; j>kezd; j--)
                                	{
                                        	if((index == 0) && (buffer[j] == 10))
						{
							continue;
						}

						sor[index] = buffer[j];
						index++;
                                	}
					

					sor[index] = 0;
					kezd = i;
					
					printf("%d\n", sorok);
					sorok--;

					reverse(sor);
				}
			}
		}
		
		if(i>kezd)
		{
			index=0;
			for(int j=i; j>kezd; j--)
                        {
                        	if((index == 0) && ((buffer[j] == 8) || (buffer[j] == 0)))
                                {
                                	continue;
                                }

                                sor[index] = buffer[j];
                                index++;
                        }

			sor[index] = 0;

			printf("%d\n", sorok);
			reverse(sor);
		
			//free(buffer);
		}
	}

	return;
}
