#include <stdio.h>

int main ()
{
	int fahrenheit;
	float celsius;
	int mi = -20;
	int ma = 200;

	for(fahrenheit=mi; fahrenheit<=ma; fahrenheit+=10)
	{
		celsius = (fahrenheit -32)/1.8;
		printf("Nos %d Fahrenheit az pont %0.2f Celsius :D\n", fahrenheit, celsius);
	}
	return 0;
}
