#include "Hunter.hpp"

void Hunter::capture(Animal* a, std::string p, std::string d){
    trophies.push_back(new Trophy(a,p,d))
}

int Hunter::countMaleLions() const{
    int count = 0;
    for(Trophy* t : trophies){
        if(t->animal->isLion() && t->animal->_male){
            count++;
        }
    }
    return count;
}

float Hunter::maxHornWeightRatio() const{
    float maxRate = -1;
    float rate;

    for(Trophy* t: trophies){
        if(t->animal->isRhino){
            Rhino* rhino = (Rhino*)t->animal;
            rate = rhino->_horn/rhino->_weight;
            if(rate > maxRate){
                maxRate = rate;
            }
        }
    }


    return maxRate;
}

bool Hunter::searchEqualTusks() const{
    bool l = false;
    for(Trophy* t: trophies){
            if(t->animal->isElephant()){
                Elephant* e = (Elephant*)t->animal;
                l = e->_leftTusk == e->_rightTusk;
            }

        if(l){
            break;
        }
    }
    return l;
}

~Hunter(){
    for(Trophy* t: trophies){
        delete t;
    }
}
