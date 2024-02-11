#include <stdio.h>

void f()
{
	static int counter = 0;

	printf("%d\n", counter++);
}

int main()
{
	f();
	f();
	f();
	f();
	f();
	f();
	
	return 0;
}
