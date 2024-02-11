#include <stdio.h>

int minus_one(int a)
{
	a = -1 * a;
	return a;
}

int main ()
{
	int a;
	scanf("%d", &a);
	printf("%d * (-1) = %d\n", a, minus_one(a));	
}
