#include <stdio.h>

int main()
{
        int r;
        printf("add meg a kör sugarát: \n");
        scanf("%d",&r);

        float ker;
        ker = 2*r*3.1415;
        float ter;
        ter = r*r*3.1414;

        printf("Kerület = (%.2f)\n", ker);
        printf("Terület = (%.2f)\n", ter);
        return 0;
}
