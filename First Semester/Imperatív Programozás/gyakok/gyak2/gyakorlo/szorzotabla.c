#include <stdio.h>

int main ()
{
	int szorzat;
	for(int i=1; i<=10; i++)
	{
		for(int j=1; j<=10; j++)
		{
			szorzat = i*j;
			printf("%d	", szorzat);
		}
		printf("\n");
	}
	return 0;
}
