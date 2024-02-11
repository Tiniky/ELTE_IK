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
            if(a[i] == egyedi[j])
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

int kivalasztas(int a[], int b[], int c[], int N, int feltetel)
{
    int db = 0;
    for(int i=0; i<N; i++)
    {
        if(a[i] == feltetel)
        {
            c[db] = b[i];
            db++;

        }
    }
    return db;
}

void sorrend(int a[], int N)
{
    for(int i=0; i<N-1; i++)
    {
        for(int j=i+1; j<N; j++)
        {
            int temp;

            if(a[i] > a[j])
            {
                temp = a[i];
                a[i] = a[j];
                a[j] = temp;
            }
        }

    }
}

int MAX(int a[], int N)
{
    int maximum = a[0];
    for(int i=1; i<N; i++)
    {
        if(a[i]>maximum)
        {
            maximum = a[i];
        }
    }

    return maximum;
}

int MIN(int a[], int N)
{
    int minimum = a[0];
    for(int i=1; i<N; i++)
    {
        if(a[i]<minimum)
        {
            minimum = a[i];
        }
    }

    return minimum;
}

int szamol(int a[], int N, int feltetel)
{
    int db = 0;
    for(int i=0; i<N; i++)
    {
        if(a[i] == feltetel)
        {
            db++;
        }
    }

    return db;
}

int sum(int a[], int N)
{
    int szum = 0;
    for(int i=0; i<N; i++)
    {
        szum += a[i];
    }

    return szum;
}

int main()
{
    int n[5] = {27,5,5,2,5};
    int summa = sum(n, 5);
    cout << summa;
    return 0;
}
