#include <stdio.h>

int max(int a[], int size)
{
	int res = a[0];
	for(int i=0; i<size; ++i)
	{
		if (a[i] > res)
		{
			res = a[i];
		}
	}
	return res;
}

int min(int a[], int size)
{
	int res = a[0];
	for(int i=0; i<size; ++i)
	{
		if (a[i] < res)
		{
			res = a[i];
		}
	}

	return res;
}

int main()
{
	int t[5]={5,27,2,19,11};
	int MIN = min(t, sizeof(t) / sizeof(t[0]));
	int MAX = max(t, sizeof(t) / sizeof(t[0]));
	
	for(int i=0; i<sizeof(t) / sizeof(t[0]); ++i)
        {
                if (t[i] == MAX)
                {
                        t[i]=MIN;
                }
		
		else if(t[i] == MIN)
		{
			t[i]=MAX;
		}
        }

	for(int i=0; i<sizeof(t) / sizeof(t[0]); ++i)
	{
		printf("%d ", t[i]);
	}

	printf("\n");
	return 0;
}
