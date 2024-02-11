#include <stdio.h>

int main ()
{
	float i;
	for(i=0; i<1.1; i+=0.1)
	{
		printf("%.2f	", i);
	}
	printf("\n");
	return 0;
}
