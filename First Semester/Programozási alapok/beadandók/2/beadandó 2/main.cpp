#include <iostream>

using namespace std;

int main()
{
    int hanyan=0;
    int out[5000];
    string benntvan[1500];

    string beKi;
    string kicsoda;
    int ora;
    int perc;


    int N;
    cin>>N;

    for (int n=0; n<5000; n++)
    {
        out[n]=-1;
    }

    for (int j=0; j<1500; j++)
    {
        benntvan[j]="";
    }

    int i=0;
    int b=0;
    int hanyadik=0;

    for (int k=0; k<N; k++) //NAGY CIKLUS
    {
        cin >> beKi;
        cin >> kicsoda;
        cin >> ora;
        cin >> perc;

        /*cout<< beKi;
        cout<< kicsoda;
        cout<< ora;
        cout<< perc; */

        bool logika=false;

        for (int l=0; l<1500; l++)
            {
                if(kicsoda==benntvan[l])
                {
                    logika=true;
                    hanyadik=l;
                }
            }



        if( beKi=="BE" && logika==false)
        {
            benntvan[i]=kicsoda;
            i++;
                if(i==1)
                {
            out[b]=ora;
            out[b+1]=perc; //esetlegesen nem b++
            b=b+2;
                }
        }



        if (beKi=="KI" && logika==true)
        {
            benntvan[hanyadik]="";
            i=i-1;

            if (i==0)
            {
                out[b]=ora;
                out[b+1]=perc;
                b=b+2;
            }
        }


        if (beKi=="KI" && logika==false && out[2]==-1)
        {
            out[0]=0;
            out[1]=0;
        }


    }

    if (i>0)
    {
      out[b]=23;
      out[b+1]=59;
      b=b+2;
    }

cout<<b/4<<" ";

for (int g=0;g<b;g++) //meddig fusson a g?
        {
            cout<<out[g]<<" ";
        }

}
