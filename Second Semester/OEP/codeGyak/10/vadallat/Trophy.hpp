#pragma once
#include <string>
#include "Animal.hpp"

class Trophy{
public:
    std::string place;
    std::string date;
    Animal* animal;

    Trophy(Animal* a, std::string p, std::string d) : animal(a), place(p), date(d) {}

    ~Trophy(){
        if(animal != nullptr){
            delete animal;
        }
    }
};
