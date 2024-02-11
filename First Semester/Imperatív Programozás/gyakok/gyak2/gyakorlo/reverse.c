#include <stdio.h>

int main ()
{
	int n;
	int ford = 0;
	int marad;

	printf("Adj meg egy számot: ");
	scanf("%d", &n);

	while (n!=0)
	{
		marad = n % 10;
		ford = ford * 10 + marad;
		n = n / 10;
	}

	printf("A fordított szám : %d\n", ford);
	return 0;
}
