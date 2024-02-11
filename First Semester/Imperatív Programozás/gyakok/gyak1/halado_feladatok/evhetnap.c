#include <stdio.h>

int main()
{
	int napok;
	printf("add meg a napok számát: \n");
	scanf("%d", &napok);

	int ev = napok / 365;
	int maradek_napok = napok % 365;
	int het = maradek_napok / 7;
	int nap = maradek_napok % 7;
	
	printf("ez pontosan %d év, %d hét és %d nap\n", ev, het, nap);
	return 0;
}
