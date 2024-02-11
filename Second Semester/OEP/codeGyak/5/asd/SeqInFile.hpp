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
    int num;
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
        if(inputStream >> num)
        {
            st = norm;
        }
        else
        {
            st = abnorm;
        }

        return st == norm;
    }

};
