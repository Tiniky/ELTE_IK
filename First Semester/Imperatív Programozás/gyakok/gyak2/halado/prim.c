#include <stdio.h>

int main()
{
	int n;
	printf("Adj meg egy számot: ");
	scanf("%d", &n);
	
	int osztok = 0;

	for(int i=2; i<n; i++)
	{
		if((n%i)==0)
		{
			osztok++;
		}
	}

	if(osztok==0)
	{
		printf("Nos ez egy prímszám uwu\n");
	}

	else
	{
		printf("Ez nem egy prímszám :c\n");
	}
	
	for(int i=1; i<=1000; i++)
	{
		osztok = 0;
		for(int j=2; j<i; j++)
		{
			if((i%j)==0)
                	{
                        	osztok++;
                	}
		}

		if(osztok==0)
        	{
                	printf("%d	", i);
        	}

	}

	printf("\n");
	return 0;
}
