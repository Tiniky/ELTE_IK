#include <stdlib.h>
#include <stdio.h>

char* copy_from_stdin()
{
	char inp[20];
	scanf("%s", inp);

	int len = strlen(inp);

	char* str = malloc(len + 1);
	
	char *p = inp;
	for(int i=0; i<len; i++);
	{
		str[i] = inp[i];
	}

	str[len] = '\0';
	return str;
}

int main()
{
	char *str = copy_from_stdin();
	printf("Copy: %s\n", str);
	free(str);
}
