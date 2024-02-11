#include <iostream>

using namespace std;

int main()
{
    int N;
    cin >> N;
    
    int konyvKod[N];
    int temaKod[N];
    int ev[N];
    int db[N];

    for(int i=0; i<N; i++)
    {
        cin >> konyvKod[i];
        cin >> temaKod[i];
        cin >> ev[i];
        cin >> db[i];
    }

    cout << "#" << endl;

    int egyediDarabSzam[N];
    egyediDarabSzam[0]=db[0];
    int egyedidbDB = 1;

    for(int i=1; i<N; i++)
    {
        bool bent = false;
        for(int j=0; j<egyedidbDB; j++)
        {
            if(db[i]==egyediDarabSzam[j])
            {
                bent = true;
            }
        }

        if(!bent)
        {
            egyediDarabSzam[egyedidbDB]=db[i];
            egyedidbDB++;
        }
    }

    int MIN = egyediDarabSzam[0];
    int min_index = 0;
    for (int i=1; i<egyedidbDB; i++)
    {
        if(egyediDarabSzam[i]<MIN && egyediDarabSzam[i]>=1)
        {
            MIN = egyediDarabSzam[i];
        }
    }

    for(int i=1; i<N; i++)
    {
        if(db[i]==MIN)
        {
            min_index = i;
            break;
        }
    }


    cout << ev[min_index] << endl;
    cout << "#" << endl;

    int egyediev[N];
    egyediev[0]=ev[0];
    int egyediDB = 1;
    
    for(int i=1; i<N; i++)
    {
        bool bent = false;
        for(int j=0; j<egyediDB; j++)
        {
            if(ev[i]==egyediev[j])
            {
                bent = true;
            }
        }

        if(!bent)
        {
            egyediev[egyediDB]=ev[i];
            egyediDB++;
        }
    }

    cout << egyediDB << endl;
    for(int i=0; i<egyediDB; i++)
    {
        cout << egyediev[i] << " ";
    }
    cout << endl;
    cout << "#" << endl;

    int egyediKonyv[N];
    egyediKonyv[0]=konyvKod[0];
    int egyedidb = 1;
    
    for(int i=1; i<N; i++)
    {
        bool bent = false;
        for(int j=0; j<egyedidb; j++)
        {
            if(konyvKod[i]==egyediKonyv[j])
            {
                bent = true;
            }
        }

        if(!bent)
        {
            egyediKonyv[egyedidb]=konyvKod[i];
            egyedidb++;
        }
    }

    int osszdb[egyedidb]={0};
    for(int i=0; i<egyedidb; i++)
    {
        for(int j=0; j<N; j++)
        {
            if(egyediKonyv[i]==konyvKod[j])
            {
                osszdb[i] += db[j];
            }
        }
    }

    int MAX = 0;
    int max_index = 0;
    for(int i=0; i<egyediDB; i++)
    {
        if(osszdb[i]>MAX)
        {
            MAX = osszdb[i];
            max_index = i;
        }
    }

    cout << egyediKonyv[max_index] << endl;
    cout << "#" << endl;

    int kezd = -1;
    int veg = -1;
    int maxKihagyas = 1;
    int maxKIndex = 0;

    for(int i=0; i<egyediDB-1; i++)
    {
        int evkulonbseg = egyediev[i+1]-egyediev[i];
        if(evkulonbseg > maxKihagyas)
        {
            maxKihagyas = evkulonbseg;
            maxKIndex = i;
        }
    }

    if (maxKihagyas != 1)
    {
        kezd = egyediev[maxKIndex] + 1;
        veg = egyediev[maxKIndex+1] - 1;
    }

    cout << kezd << " " << veg << endl;
    cout << "#" << endl;

    int egyediTema[N];
    egyediTema[0]=temaKod[0];
    int egyedi = 1;
    
    for(int i=1; i<N; i++)
    {
        bool bent = false;
        for(int j=0; j<egyedi; j++)
        {
            if(temaKod[i]==egyediTema[j])
            {
                bent = true;
            }
        }

        if(!bent)
        {
            egyediTema[egyedi]=temaKod[i];
            egyedi++;
        }
    }

    int ossz[egyedi]={0};
    for(int i=0; i<egyedi; i++)
    {
        for(int j=0; j<N; j++)
        {
            if(egyediTema[i]==temaKod[j])
            {
                ossz[i] += db[j];
            }
        }
    }

    cout << egyedi << endl;
    for(int i=0; i<egyedi; i++)
    {
        cout << egyediTema[i] << " " << ossz[i] << endl;
    }
}
