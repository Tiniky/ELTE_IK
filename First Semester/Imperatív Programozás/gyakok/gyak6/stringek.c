#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main()
{
	char szavak[10][255];

	for(int i=0; i<10; i++)
	{
		printf("%d. szó: ",i);
		scanf("%s", &szavak[i]);
	}

	for(int i=0; i<10; i++)
	{
		if(strlen(szavak[i]) > 5)
		{
			printf("5 karakternél hosszabb: %s\n", &szavak[i]);
		}

		if(strchr(szavak[i], 'x') != NULL)
		{
                        printf("van benne x: %s\n", &szavak[i]);
                }

		if(strstr(szavak[i], "alma") != NULL)
                {
                        printf("tartalmazza az alma szót: %s\n", &szavak[i]);
                }

		if(strcmp(szavak[i], "cica") == 0)
                {
                        printf("és még cica is van :D\n");
                }

		for(size_t j=0; j<strlen(szavak[i]); ++j)
        	{
			if(isdigit(szavak[i][j]))
			{
				printf("van benne szám: %s\n", &szavak[i]);
				break;
			}
		}
	}


	return 0;
}
