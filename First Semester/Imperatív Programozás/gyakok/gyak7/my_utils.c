#include "my_utils.h"

int *nagyobb(int *x, int *y)
{
        return *x < *y ? y : x; // ternary operator == if(*x < *y) return y else return x
}
