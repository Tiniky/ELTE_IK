#include <iostream>

using namespace std;

int main()
{
 /*   int N;
    int h[100];

    cin >> N;
    for(int i=0; i<N; i++)
    {
        cin >> h[i];
    }

    int maxInd = 0;
    for(int i=0; i<N; i++)
    {
        if(h[i]>h[maxInd])
        {
            maxInd = h[i];
        }
    }

    cout << "A maximum: " << maxInd+1;
    */

    int N;
    int h[100];

    cin >> N;
    for(int i=0; i<N; i++)
    {
        cin >> h[i];
    }

    int a[100];
    for(int i=0; i<N; i++)
    {
        if(h[i]<10)
        {
            a[i]=h[i]
        }
    }

}
