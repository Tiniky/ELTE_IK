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

int main()
{
    int T;
    cin >> T;

    int S;
    cin >> S;

    int N;
    cin >> N;

    int sorszam[N];
    int sportok[N];
    for (int i=0; i<N; i++)
    {
        cin >> sorszam[i];
        cin >> sportok[i];
    }

    int tanulo;
    cin >> tanulo;

    cout << "#" << endl;

    int tanuloNevezesei[N];
    int nevezesDB = kivalasztas(sorszam, sportok, tanuloNevezesei, N, tanulo);

    int egyediNevezes[nevezesDB];
    int DB = egyediKivalasztas(tanuloNevezesei, egyediNevezes, nevezesDB);

    cout << DB << endl;
    cout << "#" << endl;

    int tobszorNevezett = -1;

    int egyediTanulo[T];
    for(int i=0; i<T; i++)
    {
        egyediTanulo[i] = i+1;
    }


    return 0;
}
