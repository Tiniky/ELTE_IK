#include <iostream>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include "Plant.hpp"
#include "Radiant.hpp"
using namespace std;

void createPlanet(const std::string &fileName, vector<Plant*> &plants, int* &days){
    std::ifstream f(fileName);
    if(f.fail()){
        std::cout << "File name error!" << std::endl;
        exit(1);
    }

    int plantDB, dayDB, nut;
    std::string line, name;
    char type;

    f >> plantDB;
    plants.resize(plantDB);
    int i = 0;

    while(getline(f, line)){
        std::istringstream data(line);

        if(i == plantDB){
            data >> dayDB;
        } else {
            data >> name >> type >> nut;
            plants.push_back(Plant::create(name, type, nut));
            i++;
        }
    }

    days = &dayDB;
}

void destroyAll(vector<Plant*> &plants){
    for(Plant* p : plants){
        delete p;
    }

    Alpha::destroy();
    Delta::destroy();
    NoRad::destroy();
}

int main()
{
    vector<Plant*> plants;
    Radiant* rad = Radiant::create();
    int* days = 0;
    createPlanet("input.txt", plants, days);

    for(Plant* p: plants){
        //std::cout << p->getName() << std::endl;
        std::cout << "noveny boii o.o" << std::endl;
    }
    std::cout << *days << std::endl;

    destroyAll(plants);

    return 0;
}
