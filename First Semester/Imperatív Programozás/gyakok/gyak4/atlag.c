#include <stdio.h>

int sulyos_sum(int a[], int b[], int size)
{
	int result = 0;
	for(int i=0; i<size; ++i)
	{
		result += a[i]*b[i];
	}
	return result;
}

int sum(int a[], int size)
{
        int result = 0;
        for(int i=0; i<size; ++i)
        {
                result += a[i];
        }
        return result;
}

int main ()
{
	int t[5]={1,2,3,4,5};
	int suly[5]={1,1,2,3,5};
	float osszeg = sulyos_sum(t, suly, sizeof(t) / sizeof(t[0]));
	float db = sum(suly, sizeof(suly) / sizeof(t[0]));
	float atlag = osszeg / db;

	printf("az átlaguk: %0.2f\n", atlag);
}
