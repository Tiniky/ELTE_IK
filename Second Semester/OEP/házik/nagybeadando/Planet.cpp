#include <iostream>

#include "Planet.hpp"
#include "Plant.hpp"

Planet* Planet::_instance = nullptr;

void Planet::aDayPassed(){
    for(Plant* p : plants){
        p->TransMute(radiant);
    }

    std::cout << "A DAY PASSED" << std::endl;

    if(alfaNeed-deltaNeed>3){
        Alfa::destroy();
        Delta::destroy();
        NoRad::destroy();
        radiant = Alfa::Instance();
        std::cout << "ALFA SUG�RZ�S" << std::endl;
    } else if(deltaNeed-alfaNeed>3){
        Alfa::destroy();
        Delta::destroy();
        NoRad::destroy();
        radiant = Delta::Instance();
        std::cout << "DELTA SUG�RZ�S" << std::endl;
    } else {
        Alfa::destroy();
        Delta::destroy();
        NoRad::destroy();
        radiant = NoRad::Instance();
        std::cout << "NINCS SUG�RZ�S" << std::endl;
    }

    for(Plant* p: plants){
        if(p->isAlive()){
            std::cout << p->getName() << ": ";
            if(p->isPuffancs()){
                std::cout << "puffancs, " << p->getNut() << std::endl;
            } else if(p->isDeltafa()){
                std::cout << "deltafa, " << p->getNut() << std::endl;
            } else if(p->isParabokor()){
                std::cout << "parabokor, " << p->getNut() << std::endl;
            }
        }
    }

}

Planet::~Planet(){
    for(Plant* p : plants){
        delete p;
    }
}
