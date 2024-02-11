#include <stdio.h>
#include "my_math.h"

#define max(x,y) ((x < y) ? y : x)

#define print(x) printf("%s\n", x);

#define FOR(i, start, end) (for(i=start; i<end; i++))

int n = 3;

int main()
{
	int y = 10;
	int x = 27;

	print("Helloooo");
	printf("a max = %d\n", max(n,x));

	printf("%d négyzete nem más mint %d\n", n, negyzet());

	int arr[] = {1,2};
	Vector v1;
	v1.dim = 2;
	v1.vec = arr;

	int arr2[] = {3,4};
        Vector v2;
        v2.dim = 2;
        v2.vec = arr2;

	printf("eredmény: %d\n", product(&v1, &v2));


	/*int mat1[N][N] = {{ 1, 1, 1, 1}, { 2, 2, 2, 2}, { 3, 3, 3, 3}, { 4, 4, 4, 4}};

	int mat2[N][N] = {{ 1, 1, 1, 1}, { 2, 2, 2, 2}, { 3, 3, 3, 3}, { 4, 4, 4, 4}};

	int res[N][N];

	multiply(mat1, mat2, res);

	for(int i=0; i<N; ++i)
	{
		for(int j=0; j<N; ++j)
		{
			printf("%d ", res[i][j]);
	
		}

		printf("\n");
	}*/

	int i;
	FOR(i, 0, 10)
	{
		printf("%d ", i);
	}
	printf("\n");
}
