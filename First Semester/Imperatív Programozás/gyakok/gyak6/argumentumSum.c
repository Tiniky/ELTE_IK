#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	if(argc == 3)
	{
		int a = atoi(argv[1]);
		int b = atoi(argv[2]);

		int sum =0;
		for(int i=0; i<b; ++i)
		{
			sum += a;
		}

		printf("a*b: %d\n", sum);

	}
	else
	{
		printf("2 számot adj meg kövire pls\n");
	}

	return 0;
}
