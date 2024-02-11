#include <iostream>

using namespace std;

double legendre(double a, int k)
{
    if(k == 0)
    {
        return 1;
    }

    int s = 1;

    while(k>0)
    {
        if(k % 2 == 0)
        {
            a = a*a;
            k = k/2;
        }

        else
        {
            s = s*a;
            k = k-1;
        }
    }

    return s;
}

int main()
{

    /*double a;
    cin >> a;

    int k;
    cin >> k;

    double s = legendre(a, k);

    cout << s << endl;*/

    int n;
    cin >> n;

    double A[n];

    for(int i=1; i<=n; i++)
    {
        cin >> A[i];
    }

    double maxOsszeg = 0;
    int index1;
    int index2;

    for(int i=1; i<n; i++)
    {
        double osszeg = A[i] + A[i+1];
        if(osszeg > maxOsszeg)
        {
            maxOsszeg = osszeg;
            index1 = i;
            index2 = i+1;
        }
    }

    cout << maxOsszeg << " " << index1 << " " << index2;
}
