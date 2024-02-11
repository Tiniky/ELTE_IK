#include <iostream>

using namespace std;
//10 7 3 9 5 2 4 1 8 6
int main()
{
    int n[10];

    for(int i=0; i<10; i++)
    {
        cin >> n[i];
    }

    for(int i=0; i<9; i++)
    {
        for(int j=i+1; j<10; j++)
        {
            int temp;

            if(n[i] > n[j])
            {
                temp = n[i];
                n[i] = n[j];
                n[j] = temp;
            }
        }

    }

    for(int i=0; i<10; i++)
    {
        cout << n[i] << " ";
    }
}
