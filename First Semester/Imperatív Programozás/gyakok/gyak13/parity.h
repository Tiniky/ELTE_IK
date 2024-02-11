#ifndef PARITY_H
#define PARITY_H

#include <stdio.h>
#include <stdlib.h>

typedef struct ParityArray {
	size_t size;
	int *arr;
	size_t even_ind;
	size_t odd_ind;
} ParityArray;

int insertIntoParityArray(ParityArray *arr, int n);

void printParityArray(ParityArray *arr);

int initParityArray(ParityArray *arr, size_t size);

void disposeParityArray(ParityArray *arr);

#endif
