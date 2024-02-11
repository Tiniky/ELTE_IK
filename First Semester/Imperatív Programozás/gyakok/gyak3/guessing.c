#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
	srand(time(0));
	int szam = rand() %101;

	int tipp;
	int db = 0;

	do {
		scanf("%d", &tipp);

		if(tipp < szam)
		{
			db++;
			printf("too low\n");
		}

		else if(tipp > szam)
                {
                        db++;
			printf("too high\n");
                }
	} while (tipp != szam);
	
	if(db==0)
	{
		printf("AZTAROHADT elsőre o.o\n");
	}

	else if(db<5)
        {
                printf("nicee kitaláltad GJ :D\n");
        }

	else if(db>4)
        {
                printf("ez nem a te játékod buddy :c\n");
        }





	return 0;
}
