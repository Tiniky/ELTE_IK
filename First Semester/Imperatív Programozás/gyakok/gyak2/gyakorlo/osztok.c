#include <stdio.h>

int main ()
{
	int n;
	printf("Adj meg egy számot: ");
	scanf("%d", &n);

	int i;
	for(i = 1; i<=n; i++)
	{
		if((n%i)==0)
		{
			printf("%d ", i);
		}
	}
	printf("\n");
	return 0;
}
