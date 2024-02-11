#include <stdio.h>

int sum(int a[], int b[], int size)
{
	int result = 0;
	for(int i=0; i<size; ++i)
	{
		result += a[i]*b[i];
	}
	return result;
}

int main ()
{
	int t[5]={1,2,3,4,5};
	int suly[5]={1,1,2,3,5};
	int res = sum(t, suly, sizeof(t) / sizeof(t[0]));

	printf("az összegük: %d\n", res);
}
