#include <stdio.h>

int szamol(char a[])
{
	int length=0;
	while(a[length] != '\0')
	{
		length++;
	}
	return length;
}

int main()
{
	char szo[1000];
	scanf("%s", &szo);
	int hossz = szamol(szo);
	printf("ez kérlek szépen %d karakter :D\n", hossz);

	return 0;
}
