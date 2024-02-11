#include <iostream>

using namespace std;

int main()
{
    const int MAX_N = 100;
    int t[MAX_N];

    int N;
    cin >> N;

    for(int i=0; i<N; i++)
    {
        cin >> t[i];
    }

    bool oszhatoOt = false;

    for(int i=0; i<N; i++)
    {
        if(t[i] % 5 == 0)
        {
            oszhatoOt = true;
        }
    }

    if (oszhatoOt == true)
    {
        cout << "nicee";
    }
    else
    {
        cout << "nope";
    }
}
