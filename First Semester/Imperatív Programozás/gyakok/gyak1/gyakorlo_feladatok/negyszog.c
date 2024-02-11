#include <stdio.h>

int main()
{
	int a,b;
	printf("add meg a négyszög 2 oldalát: \n");
	scanf("%d %d",&a, &b);
	
	int ker;
	ker = 2*a + 2*b;
	int ter;
	ter = a*b;

	printf("Kerület = (%d)\n", ker);
	printf("Terület = (%d)\n", ter);
	return 0;
}
