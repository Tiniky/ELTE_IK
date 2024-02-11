#include <iostream>
#include "SeqInFile.hpp"

using namespace std;

int main()
{
    SeqInFile f("inp3.txt");

    f.Read();

    bool haromGolDeNemNyert = false;
    int maxGol = 0;
    std::string maxDatum = f.merk.datum;

    while(f.st == SeqInFile::norm){
        haromGolDeNemNyert = haromGolDeNemNyert || (f.merk.golDB >= 3 && f.merk.eredmeny == "V");

        int s = f.merk.masodikFelidosGolDB;
        if(s > maxGol){
            maxGol = s;
            maxDatum = f.merk.datum;
        }

        f.Read();
    }

    if(haromGolDeNemNyert){
        std::cout << "yes" << " " << maxDatum << std::endl;
    } else{
        std::cout << "no" << " " << maxDatum << std::endl;
    }

    return 0;
}
