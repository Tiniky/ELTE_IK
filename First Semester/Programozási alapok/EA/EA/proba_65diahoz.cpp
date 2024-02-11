#include <iostream>
#include <cassert>///assert-hez !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
using namespace std;

string s0;
int t0[10];
int n;
///int t[n];///error: array bound is not an integer constant before ']' token

int fv();

int main()
{
    cerr << "Az fv fugveny hivasa:" << __func__<< ", sor:" << __LINE__+1 << endl;///!!!!!!!!!
    cout << "fv():" << fv() << endl;//fv()=véletlenérték

    cout << "s0:\"" << s0 << "\"" << endl;///s0=""

    cout << "t0:{ ";
    for (int i=0;i<10;++i) cout << t0[i] << ' ';
    cout << '}' << endl;///t0={0 0 0 0 0 0 0 0 0 0}

    int t[10];
    cout << "t:{ ";
    for (int i=0;i<10;++i) cout << t[i] << ' ';
    cout << '}' << endl;///t={? ? ? ? ? ? ? ? ? ?}

    cout << "n:" << n << endl;///n=0
    int tt[n];///0 elemű tömb létrehozása

    int m;
    cout << "m:" << m << endl;///m=véletlenszerű érték, általában jó nagy szám
    assert(m>0 && m<=10);///rossz méret esetén megállás, hibaüzenettel !!!!!!!!!!!!!!!!!!!!!!!
    int ttt[m];///nagyon nagy vagy negatív elemszámú tömb létrehozása

    return 0;
}

int fv()
{
    cerr << "Fuggveny:" << __func__<< ", sor:" << __LINE__ << endl;///!!!!!!!!!!!!!!!!!!!!!!!
    int i;
    ///return;///error: return-statement with no value, in function returning 'int'
    ///...
}
