#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char** argv)
{
	if(argc < 2)
		return 1;
	
	int word_count = atoi(argv[1]);

	char **strs = malloc(sizeof(char*) * word_count);

	for (int i=0; i<word_count; ++i)
	{
		strs[i] = malloc(sizeof(char*) * 20);
		scanf("%s ", strs[i]);

		if(strcmp(strs[i], "END") == 0)
		{
			word_count = i;
			free(strs[i]);
			break;
		}
	}

	for (int i=word_count - 1; i>=0; --i)
        {
                scanf("%s ", strs[i]);
        }

	for(int i=0; i<word_count; ++i)
		free(strs[i]);

	free(strs);

	printf("\n");
}
