#include "my_math.h"

int negyzet()

{
        return n * n;
}

int product(Vector *a, Vector *b)
{
	if(a->dim != b->dim)
	{
		return 0;
	}

	int res = 0;

	for(int i=0; i< a->dim; ++i)
	{
		res += a->vec[i] * b->vec[i];
	}

	return res;
}

void multiply(int a[][N], int b[][N], int res[][N])
{
	for(int i=0; i<N; ++i)
	{
		for(int j=0; j<N; ++j)
		{
			res[i][j]=0;
			for(int k=0; k<N; ++k)
			{
				res[i][j] += a[i][k] * b[k][j];
			}
		}
	}
}
