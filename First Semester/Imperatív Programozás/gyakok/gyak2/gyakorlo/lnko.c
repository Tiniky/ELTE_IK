#include <stdio.h>

int main()
{
	int a, b;
	printf("Adj meg két számot: ");
	scanf("%d %d", &a, &b);
	int osztA[a];
	int oszta = 0;
	int osztB[b];
	int osztb = 0;

	int i;
	for (i=1; i<=a; i++)
	{
		if((a%i)==0)
		{
			osztA[oszta] = i;
			oszta++;
		}
	}

	int j;
        for (j=1; j<=b; j++)
        {
                if((b%j)==0)
                {
                        osztB[osztb] = j;
                        osztb++;
                }
        }

	int lnko = 0;
	for (i=0; i<oszta; i++)
        {
		int j;
		for (j=0; j<osztb; j++)
       		{
               		if(osztA[i] == osztB[j])
                	{
                        	lnko = osztA[i];
                	}
        	}
        }
	
	 printf("A legnagyobb közös osztójuk a %d\n", lnko);

	return 0;
}
