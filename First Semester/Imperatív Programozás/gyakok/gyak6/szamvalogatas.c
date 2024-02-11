#include <stdio.h>

int main()
{
	int tomb[] = {1,2,3,4,5,6,7,8,9,10};
	FILE *fp = fopen("even_numbers.txt", "w");

	for(int i = 0; i<10; i++)
	{
		if(tomb[i] % 2 == 0)
			fprintf(fp, "%d ", tomb[i]);
	}

	fclose(fp);
}
