#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define osszehas(x,y) (strcmp(x,y))

int main()
{
	char a;
	char b;
	scanf("%s %s", a, b);

	printf("a két string összehasonlításának eredménye = %d\n", osszehas(a,b);
}
