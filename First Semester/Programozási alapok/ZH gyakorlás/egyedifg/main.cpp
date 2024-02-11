#include <iostream>

using namespace std;

int egyediKivalasztas(int a[], int egyedi[], int N)
{
    egyedi[0] = a[0];
    int egyediDB = 1;
    for(int i=1; i<N; i++)
    {
        bool bent = false;
        for(int j=0; j<egyediDB; j++)
        {
            if(a[i]==egyedi[j])
            {
                bent = true;
            }
        }

        if(!bent)
        {
            egyedi[egyediDB] = a[i];
            egyediDB++;
        }
    }

    return egyediDB;
}

int max_index(int a[], int N)
{
    int MAX = a[0];
    int max_i = 0;
    for(int i=1; i<N; i++)
    {
        if(a[i]>MAX)
        {
            MAX = a[i];
            max_i = i;
        }
    }

    return max_i;
}

int min_index(int a[], int N)
{
    int MIN = a[0];
    int min_i = 0;
    for(int i=1; i<N; i++)
    {
        if(a[i]<MIN)
        {
            MIN = a[i];
            min_i = i;
        }
    }

    return min_i;
}


int main()
{
    int szamok[10] = {1, 2, 3, 2, 5, 3, 7, 2, 3, 7};
    int egyediSzamok[10];

    int egyediszamdb = egyediKivalasztas(szamok, egyediSzamok, 10);

    for(int i=0; i<egyediszamdb; i++)
    {
        cout << egyediSzamok[i] << " ";
    }

    cout << endl;

    int maxSzam = max_index(szamok, 10);
    cout << szamok[maxSzam] << endl;

    int minSzam = min_index(szamok, 10);
    cout << szamok[minSzam] << endl;
}
