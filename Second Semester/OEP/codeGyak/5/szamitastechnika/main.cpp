#include <iostream>
#include "SeqInFile.hpp"

using namespace std;

int main()
{
    SeqInFile f("input2.txt");

    f.read();

    int bevetel = 0;
    int maxSpending = f.szamla.amount;
    std::string topSpender = f.szamla.name;

    while(f.read())
    {
        bevetel += f.szamla.amount;

        if(f.szamla.amount > maxSpending)
        {
            maxSpending = f.szamla.amount;
            topSpender = f.szamla.name;
        }
    }

    std::cout << bevetel << std::endl;

    return 0;
}
