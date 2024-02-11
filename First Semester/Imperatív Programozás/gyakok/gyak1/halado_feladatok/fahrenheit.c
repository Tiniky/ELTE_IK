#include <stdio.h>

int main()
{
	float celsius;
	printf("add meg a hőmérsékletet Celsiusban: \n");
	scanf("%f", &celsius);

	float fahrenheit = (celsius * 9 / 5) + 32;
	printf("ez kérlek szépen %.2f fahrenheit lesz köszi puszi\n", fahrenheit);
	return 0;
}
