#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>

int main()
{
    int arab[7] = {1, 5, 10, 50, 100, 500, 1000};
    char romai[8] = {'I', 'V', 'X', 'L', 'C', 'D', 'M','\0'};

    char input[1024];
    scanf("%s", input);

    bool szam = false;
    size_t i=0;
    while(i<strlen(input))
    {
        if(isdigit(input[i]))
        {
            szam = true;
        }
        else
        {
            szam = false;
            break;
        }
        i++;
    }

    int db=0;
    char romaiSzam[db];

    if(!szam)
        printf("%s: wrong input!\n", input);
    else
    {
        int n;
        sscanf(input, "%d", &n);

        if(n==0)
            printf("NULL: wrong input!\n");

        while(n != 0)
        {
            if (n >= arab[6])
            {
            romaiSzam[db] = romai[6];
            db++;
            n -= arab[6];
            }

            else if (n >= arab[6]-arab[5])
            {
                romaiSzam[db] = romai[5];
                romaiSzam[db+1] = romai[6];
                db+=2;
                n -= arab[6]-arab[5];
            }

            else if (n >= arab[5])
            {
                romaiSzam[db] =romai[5];
                db++;
                n -= arab[5];
            }

            else if (n >= arab[5]-arab[4])
            {
                romaiSzam[db] = romai[4];
                romaiSzam[db+1] =romai[5];
                db+=2;
                n -= arab[5]-arab[4];
            }

            else if (n >= arab[4])
            {
                romaiSzam[db] = romai[4];
                db++;
                n -= arab[4];
            }

            else if (n >= arab[4]-arab[2])
            {
                romaiSzam[db] = romai[2];
                romaiSzam[db+1] = romai[4];
                db+=2;
                n -= arab[4]-arab[2];
            }

            else if (n >= arab[3])
            {
                romaiSzam[db] = romai[3];
                db++;
                n -= arab[3];
            }

            else if (n >= arab[3]-arab[2])
            {
                romaiSzam[db] = romai[2];
                romaiSzam[db+1] = romai[3];
                db+=2;
                n -= arab[3]-arab[2];
            }

            else if (n >= arab[2])
            {
                romaiSzam[db] = romai[2];
                db++;
                n -= arab[2];
            }

            else if (n >= arab[2]-arab[0])
            {
                romaiSzam[db] = romai[0];
                romaiSzam[db+1] = romai[2];
                db+=2;
                n -= arab[2]-arab[0];
            }

            else if (n >= arab[1])
            {
                romaiSzam[db] =romai[1];
                db++;
                n -= arab[1];
            }

            else if (n >= arab[1]-arab[0])
            {
                romaiSzam[db] = romai[0];
                romaiSzam[db+1] = romai[1];
                db+=2;
                n -= arab[1]-arab[0];
            }

            else if (n >= arab[0])
            {
                romaiSzam[db] = romai[0];
                db++;
                n -= arab[0];
            }
        }
        printf("%s\n", romaiSzam);
    }
}
