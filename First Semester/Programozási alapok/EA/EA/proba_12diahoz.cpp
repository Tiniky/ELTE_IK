#include <iostream>
using namespace std;

int n;
///int t[n];///error: array bound is not an integer constant before ']' token

int main()
{
    cout << "n:" << n << endl;///n=0
    int tt[n];///0 elemű tömb létrehozása

    ///int tttt[-10];///|error: size of array 'tttt' is negative|

    int m;
    cout << "m:" << m << endl;///m=véletlenszerű érték, általában jó nagy szám
    int ttt[m];///nagyon nagy vagy negatív elemszámú tömb létrehozása

    return 0;
}
