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

int egyediKivalasztas2(int a[], int egyedi[], int N)
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
    int Sz;
    cin >> Sz;

    int S;
    cin >> S;

    int iskolak[1000];
    string szakmak[1000];

    for(int i=0; i<S; i++)
    {
        cin >> szakmak[i];
        cin >> iskolak[i];
    }

    string egyediSzakmak[1000];

    int egyediDB = egyediKivalasztas(szakmak, egyediSzakmak, S);

    cout << "#" << endl;
    cout << egyediDB << endl;
    cout << "#" << endl;

    int gyakori[1000] = {0};

    for(int i=0; i<S; i++)
    {
        for(int j=0; j<egyediDB; j++)
        {
            if(szakmak[i]==egyediSzakmak[j])
            {
                gyakori[j]++;
            }
        }
    }

    bool van = false;
    for(int i=0; i<egyediDB; i++)
    {
       if(gyakori[i]==1)
        {
            cout << egyediSzakmak[i] << endl;
            van = true;
            break;
        }

    }

    if(!van)
    {
        cout << "NINCS" << endl;
    }

    cout << "#" << endl;

    for(int i=0; i<egyediDB; i++)
    {
        cout << egyediSzakmak[i] << " " << gyakori[i] << endl;
    }

    cout << "#" << endl;

    int egyediIskolak[1000];
    int egyediDB2 = egyediKivalasztas2(iskolak, egyediIskolak, Sz);

    int legtobbet[1000] = {0};
    for(int i=0; i<Sz; i++)
    {
        for(int j=0; j<egyediDB2; j++)
        {
            if(iskolak[i]==egyediIskolak[j])
            {
                legtobbet[j]++;
            }
        }
    }

    int MAX = legtobbet[0];
    int max_index = 0;
    for(int i=1; i<egyediDB2; i++)
    {
        if(legtobbet[i]>MAX)
        {
            MAX = legtobbet[i];
            max_index = i;
        }
    }

    cout << egyediIskolak[max_index] << endl;

    cout << "#" << endl;

}
