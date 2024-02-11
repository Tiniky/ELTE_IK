#include <iostream>

using namespace std;

int main()
{
    int N;
    cin >> N;
    string beki[N];
    string felhasznalo[N];
    int ora[N];
    int perc[N];

    for(int i=0; i<N; i++)
    {
        cin >> beki[i];
        cin >> felhasznalo[i];
        cin >> ora[i];
        cin >> perc[i];
    }

    string aktiv[N];
    int aktivhossz = 0;
    string kilepett[N];
    int kilepetthossz = 0;

    int kezdora[N];
    int kezdperc[N];
    int vegora[N];
    int vegperc[N];
    int aktivdb = 0;

    bool volt = false;

    for(int i=0; i<N; i++)
    {
        for(int j=0; j<aktivhossz; j++)
        {
            if(beki[i]=="BE" && felhasznalo[i]!=aktiv[j])
            {
                aktiv[aktivhossz]=felhasznalo[i];
                aktivhossz++;
            }

            else if(beki[i]=="KI" && felhasznalo[i]==aktiv[j])
            {
                aktiv[j]="";
                kilepett[kilepetthossz] = felhasznalo[i];
                kilepetthossz++;
            }

            else if(beki[i]=="KI" && felhasznalo[i]!=aktiv[j])
            {
                for(int k=0; k<kilepetthossz; k++)
                {
                    if(aktiv[j]!=kilepett[k])
                    {

                    }
                }
            }
        }
    }

}
