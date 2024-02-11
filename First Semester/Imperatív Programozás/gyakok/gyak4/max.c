#include <stdio.h>

int max(int a[], int size)
{
	int res = a[0];
	for(int i=1; i<size; ++i)
	{
		if (a[i] > res)
		{
			res = a[i];
		}
	}
	return res;
}

int main()
{
	int valami[5]={10,27,19,66,2};
	printf("max lesz: %d\n", max(valami, sizeof(valami)/sizeof(valami[0])));
}
