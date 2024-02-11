#include <stdio.h>

float avg(int *start, int *end)
{
	int sum = 0;
	int db = 0;

	for(int i=0; (start + i) <= end; ++i)
	{
		sum += *(start +i);
		db++;
	}
	return sum/ (float) db;
}

int main()
{
	int arr[] = {1,2,3,4,5};
	printf("az átlag lesz = %0.2f\n", avg(arr, arr+4));

	return 0;
}
