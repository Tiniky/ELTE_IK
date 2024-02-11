#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

class InvalidFileException : public std::exception{};

class SeqInFile
{
private:
    std::ifstream beolvasas;

    struct Korhaz{
        std::string nev;
        int betegDB;
        int gepenDB;
    };

    Korhaz korhaz;

public:

    enum Status{
        norm, abnorm
    };

    Status st;

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
        int gepenOssz;
    };

    NapiAdat napiadat;

    void Read()
    {
        std::string sor;

        if(std::getline(beolvasas, sor))
        {
            st = norm;
            std::istringstream adatok(sor);
            napiadat.gepenOssz = 0;

            adatok >> napiadat.datum >> napiadat.fertozottSzam;

            while(adatok >> korhaz.nev >> korhaz.betegDB >> korhaz.gepenDB)
            {
                napiadat.gepenOssz += korhaz.gepenDB;
            }

        }
        else
        {
            st = abnorm;
        }
    }
};
