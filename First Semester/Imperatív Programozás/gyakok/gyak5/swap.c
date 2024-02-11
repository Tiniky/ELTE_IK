#include <stdio.h>

void swap(int* a, int* b)
{
	int c = *a;
	*a = *b;
	*b = c;
	return;
}

int main()
{
	int a = 10;
	int b = 27;

	printf("a: %d és b: %d\n", a , b);
	swap(&a, &b);
	printf("a: %d és b: %d\n", a , b);
	
	return 0;
}
