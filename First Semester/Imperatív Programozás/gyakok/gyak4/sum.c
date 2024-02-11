#include <stdio.h>

int sum(int a[], int size)
{
	int result = 0;
	for(int i=0; i<size; ++i)
	{
		printf("%d\n", a[i]);
		result += a[i];
	}
	return result;
}

int main ()
{
	int t[10]={1,4,0,15,27,10,6,66,420,2};
	int res = sum(t, sizeof(t) / sizeof(t[0]));

	printf("az összegük: %d\n", res);
}
