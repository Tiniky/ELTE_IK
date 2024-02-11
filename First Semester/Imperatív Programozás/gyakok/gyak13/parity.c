#include "parity.h"

int initParityArray(ParityArray *arr, size_t size) {
	arr->size = size;

	arr->arr = malloc(sizeof(int) * size);

	if(arr->arr == NULL)
		return 0;
	
	arr->even_ind = 0;
	arr->odd_ind = size -1;

	return 1;
}

int insertIntoParityArray(ParityArray *arr, int n) {
        if(arr->even_ind > arr->odd_ind)
                return 1;

        if(n % 2 == 0) {
                arr->arr[arr->even_ind] = n;
                arr->even_ind++;
        } else {
                arr->arr[arr->odd_ind] = n;
                arr->odd_ind--;
        }

        return 0;
}

void printParityArray(ParityArray *arr) {
        for(size_t i = 0; i<arr->size; i++) {
                if(i < arr->even_ind || i > arr->odd_ind)
                        printf("%d ", arr->arr[i]);
		else
			printf("_ ");
        }
        printf("\n");
}

void disposeParityArray(ParityArray *arr) {
	free(arr->arr);
	arr->even_ind = 0;
	arr->odd_ind = 0;
	arr->size = 0;
}
