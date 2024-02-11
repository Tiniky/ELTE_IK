#include <stdio.h>
#include "parity.h"

int main() {
	ParityArray arr;

	initParityArray(&arr, 5);

	printParityArray(&arr);

	insertIntoParityArray(&arr, 2);
	insertIntoParityArray(&arr, 4);
	insertIntoParityArray(&arr, 9);

	printParityArray(&arr);

	disposeParityArray(&arr);

	return 0;
}
