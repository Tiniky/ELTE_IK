#include <stdio.h>

int main()
{
	int a, b;
	printf("Adj meg két számot: ");
	scanf("%d %d", &a, &b);
	
	int osszA=0;
	int osszB=0;
		
	int i;
	for (i=1; i<a; i++)
	{
		if((a%i)==0)
		{
			osszA += i;
		}
	}

	int j;
        for (j=1; j<b; j++)
        {
                if((b%j)==0)
                {
                        osszB += j;
                }
        }

	if(osszA==b && osszB==a)
	{
		printf("A számok barátságosak :D\n");
	}

	return 0;
}
