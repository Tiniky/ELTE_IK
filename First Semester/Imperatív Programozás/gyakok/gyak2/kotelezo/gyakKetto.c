#include <stdio.h>

int main ()
{
	int szam = 27;
	printf( "%d\n", szam);
	printf( "Tudod mit? Adj meg egy másik számot: \n");
	scanf( "%d", &szam);

	if(szam%2==0)
	{
		printf("Nos ez egy páros szám\n");
	}

	else
	{
		printf("Nos ez egy páratlan szám\n"); 
	}

	if(szam>0)
	{
        	printf("És még pozitív is\n");
        }

        else if(szam==0)
        {
                printf("ÉS egyenlő nullával, nem gondoltad volna mi\n");
        }
	
	else
        {
                printf("És van olyan negatív, mint én mostanában lol\n");
        }
	
	int maxx = 2147483647;

	printf("Fun Fact: %d a size max, na de mi történik, ha hozzá adunk egyet? o.o\n",maxx);
	printf("%d + 1 = %d\n",maxx, maxx+1);
	
	int masik;
	printf("Kész mindblow I know xd De tudod, mit mondj még egy számot: \n");
	scanf( "%d", &masik);

	float atlag = (szam + masik) / 2;

	printf("Nos a két szám átlaga nem más mint %0.2f \n",atlag);

	return 0;
}
