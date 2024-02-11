#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "functions.h"

int main(int argc, char* args[]){
	if (argc == 1)
    {
		from_input();
    }
    else
    {
        for (int i=1; i<argc; ++i)
        {
            FILE* in_file = fopen(args[i], "r");
            if (!in_file)
            {
                fprintf(stderr, "File opening unsuccessful!\n");
                continue;
            }
            else
            {
				from_files(i,in_file);
            }
        }
    }
	
	return 0;
}
