#include <iostream>

using namespace std;

long int fordX(long int a)            //�talak�tja az input x koordin�t�t, �gy, hogy a g�p �rtelmezni tudja
{
    return (a-1);
}

long int fordY(int a, long int b)     //�talak�tja az input y koordin�t�t, �gy, hogy a g�p �rtelmezni tudja
{
    return (a-b);
}

long int reverseX(long int a)       //visszaalak�tja az input x koordin�t�t, �gy, hogy a g�p �rtelmezni tudja
{
    return (a+1);
}

long int reverseY(int a, long int b)    //visszaalak�tja az input y koordin�t�t, �gy, hogy a g�p �rtelmezni tudja
{
    return (a+b);
}

int main()
{
    int N;
    cin >> N;
    int M;
    cin >> M;
    int K;
    cin >> K;
    long int E;
    cin >> E;

    long int sivatag[M][N];

    int bX;
    int bY;
    int jX;
    int jY;

    long int FbX[E];
    long int FbY[E];
    long int FjX[E];
    long int FjY[E];

    for(long int i=0; i<E; i++)     //beolvassa az inputot
    {
        cin >> bX;
        FbX[i] = fordX(bX);
        cin >> bY;
        FbY[i] = fordY(M, bY);
        cin >> jX;
        FjX[i] = fordX(jX);
        cin >> jY;
        FjY[i] = fordY(M, jY);
    }

    for(int i=0; i<M; i++)          //felt�lti 0-val a t�mb�t
    {
        for(int j=0; j<N; j++)
        {
            sivatag[i][j] = 0;
        }
    }

    for(long int e=0; e<E; e++)
    {
        for(int i=FjY[e]; i<FbY[e]+1; i++)          //felt�lti 0-val a t�mb�t
        {
            for(int j=FbX[e]; j<FjX[e]+1; j++)
            {
                sivatag[i][j] += 1;
            }
        }
    }

    long int viz = 0;
    long int vizmax = 0;
    int maxX = 0;
    int maxY = 0;
    for(int m=0; m<M-K; m++)
    {
        for(int n=0; n<N-K; n++)
        {
            viz = 0;
            for(int i=m; i<m+K; i++)
            {
                for(int j=n; j<n+K; j++)
                {
                    viz += sivatag[i][j];
                }
            }

            if(viz > vizmax)
            {
                vizmax = viz;
                maxX =  n;
                maxY =  m+K-1;
            }
        }
    }

    cout << vizmax << endl;

    long int gyujtoX = reverseX(maxX);
    long int gyujtoY = fordY(M,maxY);

    cout << gyujtoX << " " << gyujtoY<< endl;

    /*
    cout << endl;
    for(int i=0; i<M; i++)          //teszt
    {
        for(int j=0; j<N; j++)
        {
            cout << sivatag[i][j] << " ";
        }
        cout << endl;
    }
    cout << endl<< maxX << " " << maxY;
    */

    return 0;
}
