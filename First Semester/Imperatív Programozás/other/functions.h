#ifndef FUNCTIONS_H
#define FUNCTIONS_H

char* reverse(char* cr) {
        char* new=calloc(strlen(cr)+1,sizeof(char));
        int length=strlen(cr)-1;
        for (int i=0; i < length+1; ++i) {
                new[i]=cr[length-i];
        }
        return new;
}

void from_input() {
	char** new_t=calloc(8, sizeof(char*));
	if (new_t==NULL)
		{
			fprintf(stderr, "Memory allocation failed!\n");
			exit(2);
		}				
	char* current=malloc(sizeof(char)*1025);
	if (current==NULL)
		{
			fprintf(stderr, "Memory allocation failed!\n");
			exit(2);
		}                
	int index=0;				
	
	do {
		scanf("%1024[^\n]",current);
		new_t[index] = reverse(current);
		index++;
		char** current_ptr=realloc(new_t, sizeof(char*)*(index+1));
	       	if (current_ptr !=0) 
		{
			new_t=current_ptr;
		}
		else
		{
			fprintf(stderr, "Memory allocation failed!\n");
			exit(2);
		}
	} while ((fgets(current,1025,stdin))!=NULL);;
				
	for (int i=index-2; i>=0; --i) 
	{
		printf("%d %s\n",i+1, new_t[i]);
	}

	for (int i=0; i<index; ++i) 
	{
		free(new_t[i]);
	}
	free(new_t);
	free(current);
}

void from_files(int i,FILE* in_file){
	char** new_t=calloc(8, sizeof(char*)); 
	if (new_t==NULL)
	{
		fprintf(stderr, "Memory allocation failed!\n");
		exit(2);
	}
	char* current=malloc(sizeof(char)*1025);
	if (current==NULL)
	{
		fprintf(stderr, "Memory allocation failed!\n");
		exit(2);
	}
	int index=0;

	do {
		fscanf(in_file,"%1024[^\n]",current);
		new_t[index] = reverse(current);
		index++;
		char** current_ptr=realloc(new_t, sizeof(char*)*(index+1));
		if (current_ptr !=0) 
		{
			new_t=current_ptr;
		}
		else
		{
			fprintf(stderr, "Memory allocation failed!\n");
			exit(2);
		}
	} while ((fgets(current,1025,in_file))!=NULL);
	
	for (int i=index-2; i>=0; --i) 
	{
		if ((strlen(new_t[i]))==1)
		{
			printf("%d \n",i+1);
		}
		else
		{
			printf("%d %s\n",i+1, new_t[i]);	
		}
		
	}
                
	for (int i=0; i<index; ++i) 
	{
		free(new_t[i]);
	}
	free(new_t);
	free(current);
	fclose(in_file);
}

#endif 
