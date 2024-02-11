#include <stdio.h>
#include <stdbool.h>

int main ()
{
	int INT;
	long int LINT;
	unsigned int UINT;
	unsigned long int ULINT;
	char CHAR;
	bool BOOL;
	float FLOAT;
	double DOUBLE;
	long double LDOUBLE;

	printf(" az int %zu bájton van ábrázolva\n", sizeof(INT));
	printf(" a long int %zu bájton van ábrázolva\n", sizeof(LINT));
	printf(" az unsigned int %zu bájton van ábrázolva\n", sizeof(UINT));
	printf(" az unsigned long int %zu bájton van ábrázolva\n", sizeof(ULINT));
	printf(" a char %zu bájton van ábrázolva\n", sizeof(CHAR));
	printf(" a bool %zu bájton van ábrázolva\n", sizeof(BOOL));
	printf(" a float %zu bájton van ábrázolva\n", sizeof(FLOAT));
	printf(" a double %zu bájton van ábrázolva\n", sizeof(DOUBLE));
	printf(" az long double %zu bájton van ábrázolva\n", sizeof(LDOUBLE));

	return 0;

}
