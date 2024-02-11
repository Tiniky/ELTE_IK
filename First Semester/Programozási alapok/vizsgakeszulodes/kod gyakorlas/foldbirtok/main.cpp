#include <iostream>

using namespace std;

int main()
{

    int M;
    cin >> M;

    int kezd[M];
    int veg[M];
    int ber[M];

    for(int i=0; i<M; i++)
    {
        cin >> kezd[i];
        cin >> veg[i];
        cin >> ber[i];
    }

    cout << "#" << endl;

    int keresett[M];
    int szum = 0;
    for(int i=0; i<M; i++)
    {
        keresett[i] = (veg[i] - kezd[i] + 1) * ber[i];
        szum += keresett[i];
    }

    cout << szum << endl;
    cout << "#" << endl;

    int maxKereset = 0;
    for(int i=0; i<M; i++)
    {
        if(keresett[i] > maxKereset)
        {
            maxKereset = keresett[i];
        }
    }

    int maxIndexek[M];
    int maxDB = 0;

    for(int i=0; i<M; i++)
    {
        if(keresett[i]==maxKereset)
        {
            maxIndexek[maxDB] = i;
            maxDB++;
        }
    }

    int napok[maxDB];
    for(int i=0; i<maxDB; i++)
    {
        for(int j=0; j<M; j++)
        {
            if(j==maxIndexek[i])
            {
                napok[i] = veg[j]-kezd[j]+1;
            }
        }
    }

    int legkisebb = 10000;
    for(int i=0; i<maxDB; i++)
    {
        if(napok[i]<legkisebb)
        {
            legkisebb = napok[i];
        }
    }

    cout << legkisebb << endl;
    cout << "#" << endl;

    int legkisebbKezd;
    int legnagyobbVeg = 1;

    for(int i=0; i<M; i++)
    {
        if(veg[i]>legnagyobbVeg)
        {
            legnagyobbVeg = veg[i];
        }
    }

    int kezdSorrend[M];
    for(int i=0; i<M; i++)
    {
        kezdSorrend[i] = kezd[i];
    }

    for(int i=0; i<M-1; i++)
    {
        for(int j=i+1; j<M; j++)
        {
            int temp;

            if(kezdSorrend[i]>kezdSorrend[j])
            {
                temp = kezdSorrend[i];
                kezdSorrend[i] = kezdSorrend[j];
                kezdSorrend[j] = temp;
            }
        }
    }

    legkisebbKezd = kezdSorrend[0];

    int kezdIndexek[M];
    for(int i=0; i<M; i++)
    {
        for(int j=0; j<M; j++)
        {
            if(kezdSorrend[i]==kezd[j])
            {
                kezdIndexek[i] = j;
            }
        }
    }

    int munkanapok = legnagyobbVeg - legkisebbKezd +1;
    int dolgoztak[munkanapok] = {0};

    for(int i=0; i<M; i++)
    {
        for(int j=0; j<M; j++)
        {
            if(kezdIndexek[i]==j)
            {
                for(int k=kezd[j]; k<=veg[j]; k++)
                {
                    dolgoztak[k-1] += 1;
                }
            }
        }
    }

    int dolgozoMAX = 0;
    for(int i=0; i<munkanapok; i++)
    {
        if(dolgoztak[i]>dolgozoMAX)
        {
            dolgozoMAX = dolgoztak[i];
        }
    }

    cout << dolgozoMAX << endl;
    cout << "#" << endl;

    int maxDolgozo[M];
    int maxDolgozDB = 0;
    int hossz = 0;

    for(int i=0; i<munkanapok; i++)
    {
        if(dolgoztak[i] == dolgozoMAX)
        {
            hossz++;
            if(dolgoztak[i+1] != dolgozoMAX)
            {
                maxDolgozo[maxDolgozDB] = hossz;
                maxDolgozDB++;
                hossz = 0;
            }
        }
    }

    int leghosszabb = 0;
    for(int i=0; i<maxDolgozDB; i++)
    {
        if(maxDolgozo[i]>leghosszabb)
        {
            leghosszabb = maxDolgozo[i];
        }
    }

    cout << leghosszabb << endl;
    cout << "#" << endl;

    for(int i=0; i<munkanapok; i++)
    {
        if(dolgoztak[i] == 0)
        {
            cout << i + dolgoztak[0] << " ";
            if(dolgoztak[i+1] != 0)
            {
                cout << i + dolgoztak[0] << endl;
            }
            else
            {
                while(dolgoztak[i] == 0)
                {
                    i++;
                }

                cout << i << endl;
            }
        }
    }

    return 0;
}
