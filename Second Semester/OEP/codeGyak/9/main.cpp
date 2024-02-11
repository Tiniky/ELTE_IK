#include <iostream>
#include "gardner.hpp"
#include "plants.hpp"

using namespace std;

int main()
{
    Garden* garden = new Garden(5);
    Gardner* gardner = new Gardner(garden);

    gardner->plant(1, Potato::inst(), 3);
    gardner->plant(2, Pea::inst(), 3);
    gardner->plant(4, Rose::inst(), 3);

    std::cout << "A betakarítható parcellák azonosítói: ";
    for(int i=0 : gardner->_g->canHarvest(6)){
        std::cout << i << " ";
    }
    std::cout << std::endl;

    delete gardner;
    delete garden;

    Potato::destroy;
    Pea::destroy;
    Rose::destroy;

    return 0;
}
