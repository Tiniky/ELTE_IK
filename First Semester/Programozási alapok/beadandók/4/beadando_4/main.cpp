#include <iostream>

using namespace std;

int main()
{

    int N;      //x koordinata
    cin >> N;

    int M;      //y koordinata
    cin >> M;

    int K;      //gyujto oldalhossz
    cin >> K;

    int E;      //eso db
    cin >> E;

    int sivatag[M][N];

    for(int i=0; i<M; i++)     //feltoltom nullaval a matrixot
    {
        for(int j=0; j<N; j++)
        {
            sivatag[i][j]=0;
        }
    }

    int ba_x[100000];       //bal also x koordinata
    int ba_y[100000];       //bal also y koordinata
    int jf_x[100000];       //jobb felso x koordinata
    int jf_y[100000];       //jobb felso y koordinata

    int fordBA_x[100000];
    int fordBA_y[100000];
    int fordJF_x[100000];
    int fordJF_y[100000];

    for(int i=0; i<E; i++)
    {
        cin >> ba_x[i];
        cin >> ba_y[i];
        cin >> jf_x[i];
        cin >> jf_y[i];
    }

    for(int k=0; k<E; k++)
    {
        fordBA_x[k] = ba_x[k] - 1;  //ki kell vonni egyet, hogy jol szamolja
        fordBA_y[k] = M - ba_y[k];  //ki kell vonni az Mbol, hogy forditva legyen
        fordJF_x[k] = jf_x[k] - 1;
        fordJF_y[k] = M - jf_y[k];
    }

    for(int k=0; k<E; k++)
    {
        for(int i=fordJF_y[k]; i<fordBA_y[k]+1; i++)      //megnoveli 1el ott ahol esett
        {
            for(int j=fordBA_x[k]; j<fordJF_x[k]+1; j++)
            {
                sivatag[i][j]+=1;
            }
        }
    }

    int MAX = 0;
    int max_x = 0;
    int max_y = 0;

    for(int i=0; i<M; i++)      //megkeresi a maxot es a koordinatait
    {
        for(int j=0; j<N; j++)
        {
            if(sivatag[i][j]>MAX)
            {
                MAX = sivatag[i][j];
                max_x = j;
                max_y = i;
            }
        }
    }

    int viz = 0;
    for(int i=max_y-K/2; i<(max_y+K/2)+1; i++)      //megszamoljuk a vizmennyiseget
    {
        for(int j=max_x-K/2; j<(max_x+K/2)+1; j++)
        {
            viz += sivatag[i][j];
        }
    }

    cout << viz <<endl;
    cout << (max_x-K/2)+1<< " " << M -(max_y+K/2) <<endl;       //a bal also koordinatak x-K/2 es y+K/2 csak atalkaitva

    cout << endl;
    for(int i=0; i<M; i++)
    {
        for(int j=0; j<N; j++)
        {
            cout << sivatag[i][j] << " ";
        }
        cout << endl;
    }

    cout << endl;
    cout << MAX << " " << max_x << " " << max_y;
}
