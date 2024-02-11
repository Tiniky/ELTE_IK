#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

class InvalidFileException : public std::exception{};

class SeqInFile
{
private:
    enum Status{
        norm, abnorm;
    };

    Status st;

    std::ifstream beolvasas;

    struct Korhaz{
        std::string nev;
        int betegDB;
        int gepDB;
    };

    Korhaz korhaz;

public:
    SeqInFile(std::string fileNev)
    {
        beolvasas.open(fileNev);
        if(beolvasas.fail())
        {
            throw InvalidFileException();
        }
    }

    struct NapiAdat{
        std::string datum;
        int fertozottSzam;
        int korhazbanOSSZ;
    };

    NapiAdat napiadat;

    bool Read()
    {
        std::string sor;

        if(std::getline(beolvasas, sor))
        {
            st = norm;
            std::istringstream adatok(sor);

            adatok >> napiadat.datum >> napiadat.fertozottSzam;

            while(adatok >> korhaz.nev >> korhaz.betegDB >> korhaz.gepDB)
            {
                napiadat.korhazbanOSSZ += korhaz.betegDB;
            }

        }
        else
        {
            st = abnorm;
        }

        return st == norm;
    }
};
