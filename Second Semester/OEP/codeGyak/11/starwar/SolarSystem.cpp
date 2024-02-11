#include "SolarSystem.hpp"
#include "Planet.hpp"

SolarSystem* SolarSystem::_instance = nullptr;

bool SolarSystem::MaxFirepower(StarShip* &bestShip) const{
    bool l = false;
    int maxFp;

    for(Planet* p:planets){
        int power;
        StarShip* ship;

        bool ll = p->MaxFirepower(power,ship);

        if(!ll){
            continue;
        } else if(!l){
            l = true;
            maxFp = power;
            bestShip = ship;
        } else if(power > maxFp){
            maxFp = power;
            bestShip = ship;
        }
        return l;
    }
}

Planet* SolarSystem::Defenseless() const{
    for(Planet* p:planets){
        if(p->ships.size() == 0){
            return p;
        }
    }

    return nullptr;
}

SolarSystem::~SolarSystem(){
    for(Planet* p : planets){
        delete p;
    }
}
