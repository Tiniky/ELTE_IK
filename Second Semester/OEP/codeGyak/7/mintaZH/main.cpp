#include <iostream>
#include "SeqInFile.hpp"

using namespace std;

int main()
{
    SeqInFile f("input.txt");

    bool tobbM5k = false;
    int maxKorhazban = 0;
    std::string maxDatum;

    while(f.Read())
    {
        tobbM5k = tobbM5k || f.napiadat.fertozottSzam > 5000;

        if(f.korhaz.betegDB > maxKorhazban)
        {
            maxKorhazban = f.korhaz.betegDB;
            maxDatum = f.napiadat.datum;
        }
    }

    std::cout << tobbM5k << std::endl << maxDatum << std::endl;

    SeqInFile f2("input.txt")

    while(f2.Read() && f2.napiadat.korhazbanOSSZ <=100)
    {

    }

    maxKorhazban = 0;
    maxDatum = "";

    int fertozottDB = 0;

    while(f2.Read())
    {
        fertozottDB += f2.napiadat.fertozottSzam;
        if(f2.napiadat.korhazbanOSSZ > maxKorhazban)
        {
            maxKorhazban = f2.napiadat.korhazbanOSSZ;
            maxDatum = f2.napiadat.datum;
        }
    }

    std::cout << fertozottDB << std::endl << maxDatum << " " << maxKorhazban;

    return 0;
}
