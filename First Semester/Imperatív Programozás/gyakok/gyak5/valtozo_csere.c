#include <stdio.h>

int main()
{
	int szam = 5;
	printf("%d\n", szam);
	int *p = &szam;
	*p = 3;
	printf("%d\n", szam);

	return 0;
}
