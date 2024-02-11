#include <iostream>

using namespace std;

int main()
{

    int N;
    cin >> N;

    int M;
    cin >> M;

    int K;
    cin >> K;

    int allatkert[K];
    int allat[K];
    int allatDB[K];

    for(int i=0; i<K; i++)
    {
        cin >> allatkert[i];
        cin >> allat[i];
        cin >> allatDB[i];
    }

    cout << "#" << endl;

    int osszDB[N]={0};

    for(int j=1; j<=N; j++)
    {
        for(int i=0; i<K; i++)
        {
            if(allatkert[i]==j)
            {
                osszDB[j-1]+=allatDB[i];
            }
        }
    }

    int maxDB = 0;

    for(int i=0; i<N; i++)
    {
        if(osszDB[i]>maxDB)
        {
            maxDB=osszDB[i];
        }
    }

    for(int i=0; i<N; i++)
    {
        if(osszDB[i]==maxDB)
        {
            cout << i+1 << endl;
        }
    }

    cout << "#" << endl;

    int egyediAllatok[M];
    for(int i=0; i<M; i++)
    {
        egyediAllatok[i]=i+1;
    }

    int fajElofordulas[M]={0};

    for(int j=0; j<M; j++)
    {
        for(int i=0; i<K; i++)
        {
            if(allat[i]==egyediAllatok[j])
            {
                fajElofordulas[j]+=1;
            }
        }
    }

    int legkevesebb = K;
    for(int i=0; i<M; i++)
    {
        if(fajElofordulas[i]<legkevesebb && fajElofordulas[i] != 0)
        {
            legkevesebb=fajElofordulas[i];
        }
    }

    cout << legkevesebb << endl;

    for(int i=0; i<M; i++)
    {
        if(fajElofordulas[i]==legkevesebb)
        {
            cout << egyediAllatok[i] << " ";
        }
    }

    cout << endl;
    cout << "#" << endl;

    int egyediAllatKert[N];
    for(int i=0; i<N; i++)
    {
        egyediAllatKert[i]=i+1;
    }

    int db=0;
    for(int j=0; j<N; j++)
    {
        bool vanKetto = true;
        for(int i=0; i<K; i++)
        {
            if(allatkert[i]==egyediAllatKert[j] && allatDB[i]<2)
            {
                vanKetto = false;
            }
        }

        if(vanKetto)
        {
            db++;
        }
    }

    cout << db << endl;
    cout << "#" << endl;

    bool kiirt = false;
    for(int i=0; i<N; i++)
    {
        int allatAzAllatkertben[M];
        int allatAzAllatkertbenDB = 0;
        for(int j=0; j<K; j++)
        {
            if(egyediAllatKert[i]==allatkert[j])
            {
                allatAzAllatkertben[allatAzAllatkertbenDB] = allat[j];
                allatAzAllatkertbenDB++;
            }
        }

        bool nincs = true;
        for(int j=0; j<K; j++)
        {
            if(egyediAllatKert[i+1]==allatkert[j])
            {
                for(int k=0; k<allatAzAllatkertbenDB; k++)
                {
                    if(allat[j]==allatAzAllatkertben[k])
                    {
                        nincs = false;
                    }
                }
            }
        }

        if(nincs)
        {
            cout << egyediAllatKert[i] << " " << egyediAllatKert[i+1] << endl;
            kiirt = true;
            break;
        }
    }

    if(!kiirt)
    {
        cout << -1 << endl;
    }

    cout << "#" << endl;


    return 0;
}
