#pragma once

#include <vector>

class Planet;
class StarShip;

class SolarSystem{
private:
    SolarSystem(){}
    static SolarSystem* _instance;

public:
    std::vector<Planet*> planets;

    static SolarSystem* Intsance(){
        if(_instance == nullptr){
            _instance = new SolarSystem();
        }
        return _instance;
    }

    static void destroy(){
        if(_instance != nullptr){
            delete _instance;
        }
    }

    ~SolarSystem();

    bool MaxFirepower(StarShip* &bestShip) const;
    Planet* Defenseless() const;
};
