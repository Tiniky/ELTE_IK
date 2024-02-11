#include <iostream>
#include <string>

using namespace std;

int main()
{
    const int max_N = 5000;
    string a[max_N][4];
    const int min_N = 1;
    const int max_O = 23;
    const int min_O = 0;
    const int max_P = 59;
    const int min_P = 0;
    const int max_F = 1500;

    int N;
    cin >> N;

    if(N<=max_N && N>=min_N)
    {
        for (int i=0; i<N; i++)
        {
            for (int j=0; j<4; j++)
            {
                cin >> a[i][j];
            }
        }

        string b[max_F];
        b[0] = a[0][1];
        int hossz = 1;
        int c[hossz][2];
        int aktivdb = 1;
        string d[aktivdb*2][2];

        for (int i=0; i<N; i++)
        {
            bool bent = false;
            for (int j=0; j<hossz; j++)
            {
                if (a[i][0] == "BE" && b[j] == a[i][1])
                {
                    bent = true;
                    c[j][0] += 1;
                    c[j][1] += 1;
                }

                else if (a[i][0] == "KI" && b[j] == a[i][1])
                {
                   bent = true;
                   c[j][0] += 1;
                   c[j][1] -= 1;
                }

                else if (a[i][0] == "KI" && b[j] != a[i][1] && c[j][0]==0)
                {
                    c[j][0]=1;
                    c[j][1]=-1;
                }

            }
            if (bent == false)
            {
                b[hossz] = a[i][1];
                hossz++;
                c[hossz-1][1] += 1;
            }

            bool aktiv = true;
            int tores = 0;

            for (int j=0; j<hossz; j++)
            {
                if (c[j][1] < 1)
                {
                    aktiv = false;
                    tores = j;
                    break;
                }
            }

            if (aktiv == false)
            {
                aktivdb += 1;
                for (int j=0; j<hossz; j++)
                {
                    for (int k=0; k<aktivdb*2; k++)
                    {
                        if (c[j][0] == 1  && c[j][1] <0)
                        {
                            d[k][0] = "0";
                            d[k][1] = "0";
                        }

                        else if (c[j][0] == 1  && c[j][1]>0)
                        {
                            d[k][0] = a[i][2];
                            d[k][1] = a[i][3];
                        }

                        else if (c[j][0] > 1 && c[j][1]>0)
                        {
                            for (int l = 0; l<N; l++)
                            {
                                for (int m = 0; m<4; m++)
                                {
                                    if (b[tores] == a[l][m])
                                    {
                                        d[k][0] = a[l][2];
                                        d[k][1] = a[l][3];
                                        break;
                                    }
                                }
                            }
                        }


                    }
                }
            }
        }

        cout << aktivdb +" ";
        for (int j=0; j<aktivdb*2; j++)
        {
            cout <<c[j][0]<<" "<< c[j][1]<< " "<< endl;
        }
    }
}
