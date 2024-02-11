#ifndef MY_MATH_H
#define MY_MATH_H

extern int n;

int negyzet();

struct Vector
{
	int dim;
	int *vec;
};

typedef struct Vector Vector;

int product(Vector *a, Vector *b);

#define N 4;

void multiply(int a[][N], int b[][N], int c[][N]);

#endif
