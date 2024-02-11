#include <iostream>

using namespace std;

int main()
{
    int N;
    cin >> N;

    int M;
    cin >> M;

    int pontok[N][M];

    for(int i=0; i<N; i++)
    {
       for(int j=0; j<M; j++)
       {
           cin >> pontok[i][j];
       }
    }

    int Max;
    int Min;
    for(int i=0; i<N; i++)
    {
       Max = 0;
       Min = 11;
       for(int j=0; j<M; j++)
       {
           if(pontok[i][j]>Max)
           {
               Max = pontok[i][j];
           }

           if(pontok[i][j]<Min)
           {
               Min = pontok[i][j];
           }
       }

       for(int j=0; j<M; j++)
       {
           if(pontok[i][j]==Max)
           {
               pontok[i][j] = 0;
               break;
           }
       }

       for(int j=0; j<M; j++)
       {
           if(pontok[i][j]==Min)
           {
               pontok[i][j] = 0;
               break;
           }
       }
    }

    int helyezes[N];
    for (int i=0; i<N; i++)
    {
        helyezes[i] = i+1;
    }

    int pontszamok[N];
    int osszeg;

    for (int i=0; i<N; i++)
    {
       osszeg = 0;
       for(int j=0; j<M; j++)
       {
           osszeg += pontok[i][j];
       }

       pontszamok[i] = osszeg;
    }

    int maxok[N];
    int maxdb = 0;
    int max_index[N];
    bool ures = true;

    for(int i=0; i<N; i++)
    {
        for(int j=0; j<N; j++)
        {
            if(pontszamok[j] != 0)
            {
                ures = false;
            }

        }

        Max = 0;
        if(ures == false)
        {
            for(int j=0; j<N; j++)
            {
                if(pontszamok[j]>Max)
                {
                    Max = pontszamok[j];
                }
            }

            for(int j=0; j<N; j++)
            {
                if(pontszamok[j]==Max)
                {
                    maxok[maxdb] = Max;
                    max_index[maxdb] = j+1;
                    maxdb++;
                    pontszamok[j] = 0;
                }
            }
        }

        ures = true;
    }


    int pontdb = 0;
    int pontDb[N];
    int pontindex = 0;
    for(int i=0; i<maxdb; i++)
    {
        if(maxok[i] == maxok[i+1])
        {
            pontdb++;
        }

        else
        {
            pontDb[pontindex] = pontdb+1;
            pontindex++;
            pontdb = 0;
        }
    }

    for (int i=0; i<maxdb; i++)
    {
        for (int j=0; j<pontindex; j++)
        {
            for (int k=0; k<pontDb[j]; k++)
            {
                cout << helyezes[i] << " " << max_index[i+k] << " " << maxok[i]<< endl;
            }

            i += pontDb[j];
        }
    }

}

//cout << helyezes[i] << " " << max_index[i] << " " << maxok[i]<< endl;

