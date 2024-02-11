#include <iostream>
#include "SeqInFile.hpp"

using namespace std;

int main()
{

    SeqInFile f("inp5.txt");

    f.Read();

    int vesztettPont = 0;
    bool voltMarHazaiGyozelem = false;
    int winAfter = 0;
    int igazaVolt = 0;

    while(f.st == SeqInFile::norm){
        int maradek = f.merk.golPercOsszeg % 5;

        if(f.merk.eredmeny == "GY" && f.merk.stadion == "Illovszky"){
            voltMarHazaiGyozelem = true;
            winAfter--;
        }

        if(!voltMarHazaiGyozelem){
            if(f.merk.eredmeny == "D"){
                vesztettPont += 2;
            } else{
                vesztettPont += 3;
            }
        }

        if(voltMarHazaiGyozelem && f.merk.eredmeny == "GY"){
            winAfter++;
            if(maradek == 3){
                igazaVolt++;
            }
        }

    f.Read();
    }

    if(igazaVolt == winAfter){
        cout << vesztettPont <<" yes " << winAfter <<  endl;
    } else{
        cout << vesztettPont << " no " << winAfter <<  endl;
    }

    return 0;
}
