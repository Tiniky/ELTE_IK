#include <stdio.h>

int main ()
{
	int n;
	int ford = 0;
	int marad;

	printf("Adj meg egy számot: ");
	scanf("%d", &n);
	int eredeti = n;

	while (n!=0)
	{
		marad = n % 10;
		ford = ford * 10 + marad;
		n = n / 10;
	}

	if(eredeti==ford)
	{
		printf("A szám palindrom :D\n");
	}

	else
	{
		printf("A szám nem palindrom :c\n");
	}

	return 0;
}
