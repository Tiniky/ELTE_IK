#include <stdio.h>

int mult(int n) {
        return n * -1;
}

int main () {
        unsigned int n = 10;
        printf("%d\n", mult(n));

        return 0;

}