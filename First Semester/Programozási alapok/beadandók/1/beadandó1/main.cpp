#include <iostream>

using namespace std;

int main()
{
    const int max_N = 100;
    int a[max_N];
    const int min_N = 1;
    const int max_K = 50;
    const int min_K = -20;

    int N;
    cin >> N;

    int K;
    cin >> K;

    if (N<=max_N && N>=min_N && K<=max_K && K>=min_K)
    {
        for(int i=0; i<N; i++)
        {
        cin >> a[i];
        }

        int nagyobb = 0;

        for(int i=0; i<N; i++)
        {
            if (a[i] > K)
            {
                nagyobb++;
            }
        }
        cout << nagyobb;

    }

}
