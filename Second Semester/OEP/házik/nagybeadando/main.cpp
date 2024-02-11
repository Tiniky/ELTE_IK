#include <iostream>
#include <fstream>

#include "Planet.hpp"
#include "Plant.hpp"
#include "Radiant.hpp"

using namespace std;

int read(Planet* p, std::string fileName){
    std::ifstream f(fileName);
    if(f.fail()) { cout << "Wrong file name!\n"; exit(1);}

    int plantDB, dayDB, nut;
    std::string name;
    char type;

    f >> plantDB;

    for(int i=0; i<plantDB; i++){
        f >> name >> type >> nut;
        p->plants.push_back(Plant::create(p, name, type, nut));
    }

    f >> dayDB;
    return dayDB;
}

int main()
{
    Planet* p = Planet::Intsance();

    int dayDB = read(p, "input.txt");

    std::cout << "NINCS SUGÁRZÁS" << std::endl;

    for(Plant* plant: p->plants){
        std::cout << plant->getName() << ": ";
        if(plant->isPuffancs()){
            std::cout << "puffancs, " << plant->getNut() << std::endl;
        } else if(plant->isDeltafa()){
            std::cout << "deltafa, " << plant->getNut() << std::endl;
        } else if(plant->isParabokor()){
            std::cout << "parabokor, " << plant->getNut() << std::endl;
        }
    }

    for(int i=0; i<dayDB; i++){
        p->aDayPassed();
    }

    std::cout << "A TÚLÉLŐ NÖVÉNYEK:" << std::endl;

    for(Plant* plant : p->plants){
        if(plant->isAlive()){
            std::cout << plant->getName() << ": ";
            if(plant->isPuffancs()){
                std::cout << "puffancs, " << plant->getNut() << std::endl;
            } else if(plant->isDeltafa()){
                std::cout << "deltafa, " << plant->getNut() << std::endl;
            } else if(plant->isParabokor()){
                std::cout << "parabokor, " << plant->getNut() << std::endl;
            }
        }
    }


    p->~Planet();
    p->destroy();
}
