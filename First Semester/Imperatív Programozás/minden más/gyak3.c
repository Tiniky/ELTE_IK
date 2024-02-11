#include <stdio.h>


int a_count = 0;
int b_count = 0;

void a(float);
void b(float);

void a(float n) {
	int res = n/2;
	a_count++;
	if (res > 0) b(res);
}	

void b(float n) {
	b_count++;
	if (--n > 0) a(res);
}	

int main () {
	int n;
	
	printf("na tippelj: ");
	scanf

    return 0;
}


