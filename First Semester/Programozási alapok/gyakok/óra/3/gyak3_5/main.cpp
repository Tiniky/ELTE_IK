#include <iostream>

using namespace std;

int main()
{
    int t[100];

    int N;
    cin >> N;

    for(int i=0; i<N; i++)
    {
        cin >> t[i];
    }

    int db = 0;

    for(int i=0; i<N; i++)
    {
        if(t[i] > 6)
        {
            db++;
        }
    }

    cout << "ennyi 6nál nagyobb szám: " << db;
}
