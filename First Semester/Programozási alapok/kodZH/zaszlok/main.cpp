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

void egyediKivalasztas2(int a[], int egyedi[], int N)
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
}

void gyakorisag(string a[], string egyedi[], int N, int egyediN, int gyakori[])
{
    for(int i=0; i<egyediN; i++)
    {
        for(int j=0; j<N; j++)
        {
            if(egyedi[i]==a[j])
            {
                gyakori[i] += 1;
            }
        }
    }
}

void gyakorisag2(int a[], int egyedi[], int N, int egyediN, int gyakori[])
{
    for(int i=0; i<egyediN; i++)
    {
        for(int j=0; j<N; j++)
        {
            if(egyedi[i]==a[j])
            {
                gyakori[i] += 1;
            }
        }
    }
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

int keres(int a[], int N, int feltetel)
{
    int index;
    for(int i=0; i<N; i++)
    {
        if(a[i]==feltetel)
        {
            index = i;
            break;
        }
    }
    return index;
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

int main()
{

    int O;
    cin >> O;

    int S;
    cin >> S;

    string szinek[S];
    int orszagok[S];

    for(int i=0; i<S; i++)
    {
        for(int j=0; j<2; j++)
        {
            if(j%2==0)
            {
                cin >> szinek[i];
            }

            else
            {
                cin >> orszagok[i];
            }
        }
    }

    cout << "#" << endl;

    string egyediSzinek[S];
    int szinDB = egyediKivalasztas(szinek, egyediSzinek, S);

    cout << szinDB << endl;
    cout << "#" << endl;

    int szinekGyakorisaga[szinDB] = {0};
    gyakorisag(szinek, egyediSzinek, S, szinDB, szinekGyakorisaga);

    int legkevesebbszer = MIN(szinekGyakorisaga, szinDB);

    if(legkevesebbszer==1)
    {
        int index = keres(szinekGyakorisaga, szinDB, legkevesebbszer);
        cout << egyediSzinek[index] << endl;
    }
    else
    {
        cout << "NINCS" << endl;
    }
    cout << "#" << endl;

    for(int i=0; i<szinDB; i++)
    {
        cout << egyediSzinek[i] << " " << szinekGyakorisaga[i] << endl;

    }
    cout << "#" << endl;

    int egyediOrszagok[O];
    egyediKivalasztas2(orszagok, egyediOrszagok, S);

    int szinekPerZaszlo[O] = {0};
    gyakorisag2(orszagok, egyediOrszagok, S, O, szinekPerZaszlo);

    int legtobb = MAX(szinekPerZaszlo, O);
    int index2 = keres(szinekPerZaszlo, O, legtobb);

    cout << egyediOrszagok[index2] << endl;
    cout << "#" << endl;

    int csoportok = O;
    int azonosok = 1;

    for(int i=0; i<O-1; i++)
    {
        for(int j=i+1; j<O; j++)
        {
            if(szinekPerZaszlo[i]==szinekPerZaszlo[j])
            {
                int orszag1 = egyediOrszagok[i];
                int orszag2 = egyediOrszagok[j];

                int darab = szinekPerZaszlo[i];
                string szin1[darab];
                string szin2[darab];

                for(int m=0; m<darab; m++)
                {
                    for(int n=0; n<S; n++)
                    {
                        if(orszagok[n]==orszag1)
                        {
                            szin1[m] = szinek[n];
                        }
                    }
                }

                for(int m=0; m<darab; m++)
                {
                    for(int n=0; n<S; n++)
                    {
                        if(orszagok[n]==orszag2)
                        {
                            szin2[m] = szinek[n];
                        }
                    }
                }

                int azonosDB = 0;
                for(int m=0; m<darab; m++)
                {
                    for(int n=0; n<darab; n++)
                    {
                        if(szin1[m] == szin2[n])
                        {
                            azonosDB++;
                        }
                    }
                }

                cout << azonosDB << " " << darab << endl;
                if(azonosDB == darab)
                {
                    azonosok++;
                }
            }
        }
    }
    csoportok = csoportok - azonosok;

    cout << csoportok <<endl;
    return 0;
}
