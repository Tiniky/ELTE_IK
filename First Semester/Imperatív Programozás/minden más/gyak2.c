#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TARGET 69

int main () {
	printf("na tippelj\n");
	while(1) {
		int guess;
		int guess_count = 0;
		scanf("%d", &guess);
/*
        printf("%s\n", (guess < TARGET ? "under" : "over"));
		guess_count++;
*/
		if(guess == TARGET) {
			break;
		}

		if(guess < TARGET) {
			printf("nah kicsi\n");
		} else {
			printf("eeeeeh ez meg nagy\n");
		}

	}

/*    switch(guess_count) {
        case 1:
            printf("oh boii gj\n");
            break;
    }
*/
    printf("nicee uwu\n");

    return 0;
}


