#include "Planet.hpp"
#include "StarShip.hpp"

bool Planet::MaxFirepower(int &maxFp, StarShip* &ship) const{
    bool l = false;

    for(StarShip* ss : ships){
        int fp = ss->Firepower();
        if(!l){
            l = true;
            maxFp = fp;
            ship = ss;
        } else if(fp > maxFp){
            maxFp = fp;
            ship = ss;
        }
    }

    return l;
}

int Planet::TotalShields() const{
    int sum = 0;
    for(StarShip* ss : ships){
        sum += ss->_shield;
    }
    return sum;
}

Planet::~Planet(){
    for(StarShip *ss : ships){
        delete s;
    }
}
