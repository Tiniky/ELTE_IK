#include <iostream>

using namespace std;

int egyediKivalasztas(string a[], string egyedi[], int N)
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

int main()
{
    int N;
    cin >> N;

    string nemzetiseg[N];
    string nev[N];
    float gyozelem[N];
    float vereseg[N];

    for(int i=0; i<N; i++)
    {
        cin >> nemzetiseg[i];
        cin >> nev[i];
        cin >> gyozelem[i];
        cin >> vereseg[i];
    }

    cout << "#" << endl;

    int tobbetVesztettDB = 0;
    for(int i=0; i<N; i++)
    {
        if(vereseg[i] > gyozelem[i])
        {
            tobbetVesztettDB++;
        }
    }

    cout << tobbetVesztettDB << endl;
    cout << "#" << endl;


    float osszmeccsSzam[N];
    float atlag[N];
    for(int i=0; i<N; i++)
    {
        osszmeccsSzam[i] = gyozelem[i] + vereseg[i];
        if(osszmeccsSzam[i] > 0)
        {
            atlag[i] = (gyozelem[i] / osszmeccsSzam[i]);
        }
    }

    float MAX = atlag[0];
    int max_index = 0;
    for(int i=1; i<N; i++)
    {
        if(atlag[i] > MAX)
        {
            MAX = atlag[i];
            max_index = i;
        }

        else if(atlag[i] == MAX && osszmeccsSzam[i] > osszmeccsSzam[max_index])
        {
            MAX = atlag[i];
            max_index = i;
        }
    }

    cout << nev[max_index] << endl;
    cout << "#" << endl;


    string nemNyert[N];
    int nemNyertDB = 0;

    for(int i=1; i<N; i++)
    {
        if(gyozelem[i] == 0 && vereseg[i] != 0)
        {
            nemNyert[nemNyertDB] = nev[i];
            nemNyertDB++;
        }
    }

    if(nemNyertDB > 0)
    {
        for(int i=0; i<nemNyertDB; i++)
        {
            cout << nemNyert[i] << " ";
        }
    }

    else
    {
        cout << -1;
    }

    cout << endl;
    cout << "#" << endl;


    string egyediOrszag[N];
    int egyediDB = egyediKivalasztas(nemzetiseg, egyediOrszag, N);

    int osszesGyozelem[egyediDB] = {0};
    for(int i=0; i<egyediDB; i++)
    {
        for(int j=0; j<N; j++)
        {
            if(egyediOrszag[i] == nemzetiseg[j])
            {
                osszesGyozelem[i] += gyozelem[j];
            }
        }
    }

    int MAXgyozelem = osszesGyozelem[0];
    int max_index2 = 0;
    for(int i=1; i<egyediDB; i++)
    {
        if(osszesGyozelem[i] > MAXgyozelem)
        {
            MAXgyozelem = osszesGyozelem[i];
            max_index2 = i;
        }
    }

    cout << egyediOrszag[max_index2] << endl;

    /*for(int i=0; i<egyediDB; i++)
    {
        cout << egyediOrszag[i] << " " << osszesGyozelem[i]<< " ";
    }*/
}
