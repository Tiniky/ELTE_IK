#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TO_GUESS 27

int get_guessable();
int make_guess();
int evaluate(int guess);

int make_guess()
{
	int guess;
	scanf("%d", &guess);
	return guess;
}

int get_guessable()
{
	return TO_GUESS;
}


int main()
{
	int result;
	do {
		result = evaluate(make_guess());
		if(!result)
		{
			break;
		}

		//evaluate(guess);
		printf("A szám túl %s\n", (result == 1) ? "nagy" : "kicsi");
	} while (result);

	printf("GJ kitaláltad :D\n");
	return 0;
}

int evaluate(int guess)
{
	if (guess > get_guessable())
	{
		return 1;
	}

	else if (guess < get_guessable())
        {
                return -1;
        }

	else
	{
		return 0;
	}
}
