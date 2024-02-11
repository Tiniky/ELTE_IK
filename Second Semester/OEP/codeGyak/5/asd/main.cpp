#include <iostream>
#include "SeqInFile.hpp"

using namespace std;

int main()
{
    SeqInFile f("input.txt");

    while(f.read() && f.num >= 0)
    {
    }

    int db = 0;
    while(f.read())
    {
        if(f.num%2==0)
        {
            db++;
        }
    }

    std::cout << db << std::endl;

    return 0;
}
