#include <stdio.h>

int sum(int *start, int *end)
{
	int sum = 0;
	
	for(int i=0; (start + i) <= end; ++i)
	{
		sum += *(start +i);
	}
	return sum;
}

int main()
{
	int arr[] = {1,2,3,4,5};
	printf("summa lesz = %d\n", sum(arr, arr+4));

	return 0;
}
