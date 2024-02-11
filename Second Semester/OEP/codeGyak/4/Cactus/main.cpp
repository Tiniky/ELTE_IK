#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

struct Cactus{
    std::string name, country, color;
    int height;
};

enum Status{
    abnorm, norm
};

bool read(std::ifstream &f, Cactus &c, Status &st)
{
    std::string line;
    if(getline(f,line))
    {
        std::istringstream sstream(line);
        sstream >> c.name >> c.country >> c.color >> c.height
        st = norm;
    }
    else
    {
        st = abnorm;
    }

    return st==norm;
}

int main(int argc, char* argv[])
{
    std::ifstream in("in.txt");
    //std::ifstream in(argv[1])
    if(in.fail())
    {
        std::cout << "File open error" << std::endl;
    }

    Cactus c;
    Status st;

    std::ofstream out1("out1.txt");
    std::ofstream out2("out2.txt");

    while(read(in, c, st))
    {
        if(c.height > 10)
        {
            out1 << c.name << " " << c.country << std::endl;
        }
    }

    return 0;
}
