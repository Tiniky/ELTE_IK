#include <iostream>

using namespace std;

int main()
{
    int N;
    cin >> N;

    int mennyiseg[N];
    int ar[N];

    for(int i=0; i<N; i++)
    {
        cin >> mennyiseg[i];
        cin >> ar[i];
    }

    int min_index = 1;
    int MIN = mennyiseg[0];

    for(int i=1; i<N; i++)
    {
        if(mennyiseg[i] < MIN)
        {
            MIN = mennyiseg[i];
            min_index = i+1;
        }
    }

    cout << min_index << endl;

    int nagydb=0;
    int nagy[N];

    for(int i=0; i<N; i++)
    {
        if(mennyiseg[i] > 1000)
        {
            nagy[nagydb]=ar[i];
            nagydb++;
        }
    }

    int MAXar=0;
    for(int i=0; i<nagydb; i++)
    {
        if(nagy[i]>MAXar)
        {
            MAXar = nagy[i];
        }
    }

    if(MAXar==0)
    {
        MAXar=-1;
    }

    cout << MAXar << endl;

    int egyediar[N];
    egyediar[0]=ar[0];
    int egyediDB=1;

    for(int i=1; i<N; i++)
    {
        bool bent = false;
        for(int j=0; j<egyediDB; j++)
        {
            if(ar[i]==egyediar[j])
            {
                bent = true;
                break;
            }
        }

        if(!bent)
        {
            egyediar[egyediDB]=ar[i];
            egyediDB++;
        }
    }

    cout << egyediDB << endl;

    int evdb = 0;
    int evindex[N];
    int helyimax = mennyiseg[0];

    for(int i=1; i<N; i++)
    {
        if(mennyiseg[i]>helyimax)
        {
            helyimax = mennyiseg[i];
            evindex[evdb] = i+1;
            evdb++;
        }
    }

    cout << evdb;

    for (int i=0; i<evdb; i++)
    {
        cout << " " << evindex[i];
    }

    cout << endl;
}
