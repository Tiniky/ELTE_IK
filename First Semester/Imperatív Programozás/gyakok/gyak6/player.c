#include <stdio.h>

int main()
{
	FILE *fp = fopen("player.txt", "w");

	fprintf(fp, "%s", "Tiniky\n");

	fclose(fp);
}
