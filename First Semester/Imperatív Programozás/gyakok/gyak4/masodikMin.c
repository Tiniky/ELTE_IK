#include <stdio.h>

int masodik_min(int a[], int size)
{
	int res = a[0];
	int res2;
	for(int i=0; i<size; ++i)
	{
		if (a[i] < res)
		{
			res = a[i];
		}
	}
	
	for(int i=0; i<size; ++i)
        {
                if (a[i] != res)
                {
                        res2 = a[i];
			break;
                }
        }

	for(int i=0; i<size; ++i)
        {
                if (a[i] < res2 && a[i] != res)
                {
                        res2 = a[i];
                }
        }

	return res2;
}

int main()
{
	int valami[5]={10,27,19,66,2};
	printf("a második minimum lesz: %d\n", masodik_min(valami, sizeof(valami)/sizeof(valami[0])));
}
