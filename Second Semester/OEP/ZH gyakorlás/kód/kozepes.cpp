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

class kozepes
{
    std::ifstream f;

public:
    kozepes(const char *path) : f(path)
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

    bool l = false;
    int max = 0;
    std::string mikor;

    Status st = abnorm;
    Nap nap;
    kozepes x("in.txt");

    x.read(st, nap);
    while (st == norm)
    {
        l = l || nap.uj > 5000;
        int s = nap.ossz;

        if (s > max)
        {
            max = s;
            mikor = nap.datum;
        }

        x.read(st, nap);
    }

    std::cout << std::boolalpha << l << " " << mikor << "\n";

    return 0;
}