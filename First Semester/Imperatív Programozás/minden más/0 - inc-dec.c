#include<stdio.h>
int main() {
    
    int i = 42;
    int j;
	// ++i = (i+1)
	/*
		i++:
		i = i +1
		i - 1
	*/
    j = (i++ + 10);
    // i is now 43
    // j is now 52 (NOT 53)
    
    j = (++i + 10);
    // i is now 44
    // j is now 54
    
    return 0;
}