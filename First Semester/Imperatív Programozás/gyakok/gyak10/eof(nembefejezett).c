#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	int word_count = 0;

	char **strs = malloc(sizeof(char*));
	strs[0] = malloc(20);

	while(scanf("%s", strs[word_count] != EOF)
	{
		word_count++;
		strs = realloc(strs, sizeof(char*) * word_count);
        	strs[word_count] = malloc(20);
	}
}
