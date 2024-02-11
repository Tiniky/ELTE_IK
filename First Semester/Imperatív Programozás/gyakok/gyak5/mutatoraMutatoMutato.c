#include <stdio.h>

int main()
{
	int n = 27;
	int *p = &n;
	int **pp = &p;

	int k = 10;
	printf("%d\n", **pp);
	*pp = &k;	
	printf("%d\n", **pp);
	**pp = 420;
	printf("%d\n", k);
	return 0;
}
