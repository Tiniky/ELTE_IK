#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	#define BUF_SIZE 1024
    int DB = 0;
	char buffer[BUF_SIZE];
	size_t contentSize = 1; // includes NULL
	char *content = malloc(sizeof(char) * BUF_SIZE);
	if(content == NULL)
	{
    		perror("Failed to allocate content");
    		exit(1);
	}
	content[0] = '\0'; // make null-terminated
	while(fgets(buffer, BUF_SIZE, stdin))
	{
    		char *old = content;
    		contentSize += strlen(buffer);
    		content = realloc(content, contentSize);
    		if(content == NULL)
    		{
        		perror("Failed to reallocate content");
        		free(old);
        		exit(2);
    		}

    		strcpy(content, buffer);
    		printf("%s", content);
    		DB++;
	}

	if(ferror(stdin))
	{
    		free(content);
    		perror("Error reading from stdin.");
    		exit(3);
	}

	printf("%d\n", DB);
	return 0;
}
