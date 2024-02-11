#include <stdio.h>

int x = 27;

int dupla(int a)
{
	int d = 2*a;
	
	if(d>x)
	{
		return d;
	}

	else
	{
		return a;
	}
}

int main()
{
	int a = 10;
	int b = 20;
	printf("%d\n", dupla(a));
	printf("%d\n", dupla(b));
	
	{
	int a = 50;
	printf("%d\n", dupla(a));
	printf("%d\n", dupla(b));
	}

	return 0;
}
