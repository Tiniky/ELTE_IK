#include <iostream>

using namespace std;

int main()
{
    const int N = 100;
    int t[N];

    for (int i=0; i<5; i++)
    {
        cin >> t[i];
    }

    int sum = 0;

    for (int i=0; i<5; i++)
    {
        sum = sum + t[i];
    }

    cout << sum;
}
