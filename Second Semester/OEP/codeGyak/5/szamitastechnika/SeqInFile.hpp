#include <string>
#include <fstream>
#include <sstream>

class SeqInFile
{
private:
    enum Status{
        norm, abnorm
    };

    Status st;

    std::ifstream inputStream;

public:

    struct Szamla{
        std::string name;
        int amount;
    };
    Szamla szamla;

    SeqInFile(std::string f)
    {
        inputStream.open(f);
        if(inputStream.fail())
        {
            std::cout << "File open error!" << std::endl;
        }
    }

    bool read()
    {
        std::string line;

        if(std::getline(inputStream,line);)
        {
            st = norm;
            std::istringstream lineStream(line;)
            szamla.amount = 0;

            lineStream >> szamla.name;

            std::string termek;
            int ar;
            while(lineStream >> termek >> ar)
            {
                szamla.amount += ar;
            }
        }
        else
        {
            st = abnorm;
        }

        return st == norm;
    }

};
