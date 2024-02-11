#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

class InvalidFileException : public std::exception{};

class SeqInFile
{
private:
    std::ifstream beolvasas;

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

    struct Merkozes{
        std::string datum;
        std::string ellenfel;
        std::string stadion;
        std::string eredmeny;
        int golDB;
        int masodikFelidosGolDB;
        int golPercOsszeg;
    };

    Merkozes merk;

    struct Gol{
        std::string nev;
        int perc;
        std::string tipus;
    };

    Gol gol;


    void Read()
    {
        std::string sor;

        if(std::getline(beolvasas, sor))
        {
            st = norm;
            std::istringstream adatok(sor);
            merk.golDB = 0;
            merk.masodikFelidosGolDB = 0;
            merk.golPercOsszeg = 0;

            adatok >> merk.datum >> merk.ellenfel >> merk.stadion >> merk.eredmeny;

            while(adatok >> gol.nev >> gol.perc)
            {
                merk.golDB++;
                merk.golPercOsszeg += gol.perc;

                if(gol.perc > 45){
                    merk.masodikFelidosGolDB++;
                }
            }

        }
        else
        {
            st = abnorm;
        }
    }
};
