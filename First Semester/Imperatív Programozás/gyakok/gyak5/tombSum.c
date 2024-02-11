#include <stdio.h>

int sum(int *arr, int length)
{
	int sum = 0;
	
	for(int i=0; i<length; ++i)
	{
		sum += *(arr +i);
	}
	return sum;
}

int main()
{
	int arr[] = {1,2,3,4,5};
	printf("summa lesz = %d\n", sum(arr, 5));

	return 0;
}
