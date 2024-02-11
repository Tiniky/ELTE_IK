#include <iostream>

using namespace std;

int main()
{
    int N;      //eredmény db
    cin >> N;

    int M;      //tanuló db
    cin >> M;
    
    int K;      //nyelv db
    cin >> K;

    int tanulo[N];
    int nyelv[N];
    int eredmeny[N];

    for(int i=0; i<N; i++)
    {
        cin >> tanulo[i];
        cin >> nyelv[i];
        cin >> eredmeny[i];
    }

    int MAX = 0;
    int max_index = 0;
    for(int i=0; i<N; i++)
    {
        if(eredmeny[i]>MAX)
        {
            MAX = eredmeny[i];
            max_index = i;
        }
    }

    cout << tanulo[max_index] << " " << nyelv[max_index] << endl;


    int egyedinyelv[K];
    for(int i=0; i<K; i++)
    {
        egyedinyelv[i]=i+1;
    }

    int ossz[K] = {0};
    for(int i=0; i<N; i++)
    {
        for(int j=0; j<K; j++)
        {
            if(nyelv[i]==egyedinyelv[j])
            {
                ossz[j] += 1;
            }
        }
    }

    int MAXnyelvdb = 0;
    int max_index2 = 0;
    for(int i=0; i<K; i++)
    {
        if(ossz[i]>MAXnyelvdb)
        {
            MAXnyelvdb = ossz[i];
            max_index2 = i;
        }
    }

    cout << egyedinyelv[max_index2] << endl;


    int nemValasztott[K];
    int nemValasztottDb = 0;

    for(int i=0; i<K; i++)
    {
        if(ossz[i]==0)
        {
            nemValasztott[nemValasztottDb] = egyedinyelv[i];
            nemValasztottDb++; 
        }
    }

    cout << nemValasztottDb;
    for(int i=0; i<nemValasztottDb; i++)
    {
        cout << " " << nemValasztott[i];
    }

    cout << endl;


    int noNerd = -1;
    int egyediTanulo[M];
    for(int i=0; i<M; i++)
    {
        egyediTanulo[i]=i+1;
    }

    int osszEredmeny[M] = {0};
    int eredmenyDb[M] = {0};
    for(int i=0; i<N; i++)
    {
        for(int j=0; j<M; j++)
        {
            if(tanulo[i]==egyediTanulo[j])
            {
                osszEredmeny[j] += eredmeny[i];
                eredmenyDb[j] += 1;
            }
        }
    }

    int nerd[M];
    nerd[0] = noNerd;
    int nerdDB = 0;
    for(int i=0; i<M; i++)
    {
        if((osszEredmeny[i]/eredmenyDb[i])>90)
        {
            nerd[nerdDB] = egyediTanulo[i];
            nerdDB++;
        }
    }

    cout << nerd[0] << endl;

    int supernerdDB = 0;
    int supernerd[N];

    for(int i=0; i<N; i++)
    {
        if(eredmeny[i]==100)
        {
            supernerd[supernerdDB] = tanulo[i];
            supernerdDB++;
        }
    }  

    cout << supernerdDB;
    for(int i=0; i<supernerdDB; i++)
    {
        cout << " " << supernerd[i];
    }

    cout << endl;
  
}
