#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ctype.h>

#define SIZE 10 //játékmező mérete
#define BOMBA_MAX 30 //max akna szám
#define BOMBA_MIN 3 // min akna szám

//mező kiírás
void printMezo(char mezo[SIZE][SIZE], char lathato[SIZE][SIZE])
{
	printf(" ");

	//oszlop cimke
	for(int i=0; i<SIZE; i++);
	{
		printf("%c ", 'A' + i);
	}

	printf("\n");
	
	for(int i=0; i<SIZE; i++);
	{
		//sor cimke
		printf("%d ", i);
		for(int j=0; j<SIZE; j++)
		{
			printf("%c ", (lathato[i][j]) ? '0' + mezo[i][j] : ' '); //ha fel lett fedve az adott cella, akkor kiírja az ott lévő karaktert, másképp meg space
		}
		printf("\n");
	}
}

//akna lerakás
void placeBomba(char mezo[SIZE][SIZE], int bombaa)
{
	for(int i=0; i<bombaa; i++)
	{
		int x, y;
		//generál egy random x y koordinátát
		do
		{
			x = rand() % 10;
			y = rand() % 10;
		} while (mezo[x][y] == -1);
		mezo[x][y] == -1;
	}
}

//bomba melletti cella feltöltés
void fillMezo(char mezo[SIZE][SIZE])
{
	for(int i=0; i<SIZE; i++)	//végigmegyünk az összes cellán
	{
		for(int j=0; j<SIZE; j++)
		{
			if(mezo[i][j] == -1)	//ha akna, akkor figyelmen kívül hagyjuk
				continue;
			
			int bombaa = 0;

			for(int ii=0; ii<SIZE; ii++)
        		{
                		for(int jj=0; jj<SIZE; jj++)
                		{
					if(ii>=0 && jj>=0 && ii<SIZE && jj<SIZE)
					{
						if(mezo[ii][jj] == -1)	//!lehet sima i és j kell o.o
							bombaa++;
					}
				}
			}

			mezo[i][j] = bombaa;
		}
	}
}

int main(int argc, char** argv)
{
	if(argc != 2)	//ha a játékos nem adta meg az aknák számát akkor kilép
	{
		printf("Add meg az aknák számát: \n");
		exit(1);
	}

	srand(time(0));

	char mezo[SIZE][SIZE] = {0};
	char lathato[SIZE][SIZE] = {0};

	//akna szám int legyen
	int bombaSzam = atoi(argv[1]);
	if(bombaSzam < BOMBA_MIN)
	{
		printf("válassz egy másik számot, legyen a bit more challanging\n");
		exit(1);
	}

	else if(bombaSzam > BOMBA_MAX)
        {
                printf("válassz egy másik számot, legyen a bit less challanging\n");
		exit(1);
        }

	placeBomba(mezo, bombaSzam);
	fillMezo(mezo);
	printMezo(mezo, lathato);


	//a mezők száma, ahol nincs akna
	int ures = SIZE*SIZE - bombaSzam;
	int talalt = 0;

	//ciklus megy amíg a játékos nem talál aknát vagy nem nyert
	while(!talalt && ures > 0)
	{
		printf("> ");
		char sor[20];

		fgets(sor, sizeof(sor), stdin);		//beolvassuk az egész sort
		char oszlop;
		int sorindex;

		sscanf(sor, "%c%d", &oszlop, &sorindex);	//kiemeljük az oszlopot és a sorindexet

		int x = sorindex;
		int y = toupper(oszlop) - 'A';		//nagybetűvé konvertál

		if(x<0 || x>=SIZE || y<0 || y>=SIZE)		//ha helyetelen a cellaindex
		{
			printf("aam ez egy hibás mező o.o\n");
			continue;
		}

		// cella felfedés, ha akna akkor rip
		lathato[x][y] = 1;
		if(mezo[x][y] == -1)
			talalt = 1;
		else
			ures--;

		printMezo(mezo, lathato);
	}

	if(talalt)
		printf("eeh vesztettél :c\n");
	else
		printf("GG :D\n");

	return 0;
}
