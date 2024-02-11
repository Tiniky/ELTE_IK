#include <fstream>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>

enum Status
{
    norm,
    abnorm
};

struct Nap
{
    std::string datum;
    int uj;
    int ossz;
};

class jeles
{
    std::ifstream f;

public:
    jeles(const char *path) : f(path)
    {
        if (!f)
        {
            throw std::invalid_argument("file not found");
        }
    }

    void read(Status &st, Nap &nap)
    {
        std::string line;
        std::getline(f, line);

        std::stringstream ss(line);

        ss >> nap.datum;
        ss >> nap.uj;
        nap.ossz = 0;

        std::string dummy_s;
        int ossz;
        int dummy;

        while (ss >> dummy_s >> ossz >> dummy)
        {
            nap.ossz += ossz;
        }

        st = f ? norm : abnorm;
    }
};

int main()
{

    bool ezer = false;
    int sum_osszes = 0;
    int max = 0;
    std::string mikor;

    Status st = abnorm;
    Nap nap;
    jeles x("in2.txt");

    x.read(st, nap);
    while (st == norm)
    {
        ezer = ezer || nap.ossz > 1000;

        if (ezer)
        {
            sum_osszes += nap.uj;

            if (nap.ossz > max)
            {
                max = nap.ossz;
                mikor = nap.datum;
            }
        }

        x.read(st, nap);
    }

    std::cout << sum_osszes << " " << mikor << " " << max << "\n";

    return 0;
}