#pragma once

#include <vector>
#include "Plant.hpp"
#include "Radiant.hpp"

class Plant;

class Planet{
private:
    Planet () {}
    static Planet* _instance;

public:
    int alfaNeed = 0, deltaNeed = 0;
    Radiant* radiant = NoRad::Instance();
    std::vector<Plant*> plants;

    void alfaAdd(int x){alfaNeed += x;}
    void deltaAdd(int x){deltaNeed += x;}
    void aDayPassed();

    static Planet* Intsance(){
        if(_instance == nullptr){
            _instance = new Planet();
        return _instance;
    }

    static void destroy(){
        if(_instance != nullptr){
            delete _instance;
        }
    }

    ~Planet();
};
