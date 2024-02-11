#include <iostream>
#include <fstream>
#include <sstream>

#include "Hunter.hpp"

void read(Hunter &h, std::string fileName)
{
    std::ifstream f(fileName);
    std::string line, place, date, species, gender;
    double weight, lTusk, rTusk, horn;
    Animal* animal;

    while(getline(f,line)){
        std::istringstream stringStream(line);

        stringStream >> place >> date >> species >> weight >> gender;

        if(species == "lion"){
            animal = new Lion(weight, gender == "male");
        } else if(species == "rhino"){
            stringStream >> horn;
            animal = new Rhino(weight,gender =="male", horn)
        } else if(species == "elephant"){
            stringStream >> lTusk >> rTusk;
            animal = new Elephant(weight, gender == "male", lTusk, rTusk);
        }

        h.capture(animal,place,date);
    }
}

int main()
{

    Hunter hunter("Bill", 55);
    read(hunter, "input.txt");

    std::cout << hunter.countMaleLions() << std::endl;
    std::cout << hunter.maxHornWeightRatio() << std::endl;
    std::cout << hunter.searchEqualTusks() << std::endl;

    return 0;
}
