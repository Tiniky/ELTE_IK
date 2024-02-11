#include <iostream>
#include <fstream>

#include "SolarSystem.hpp"
#include "Planet.hpp"
#include "StarShip.hpp"

using namespace std;

int main()
{
    SolarSystem* ss = SolarSystem::Instance();

    std::ifstream f("input.txt");

    std::string pName, sName, sType;
    int shield, armor, guard;
    int n, m;

    f >> n;

    for(int i=0; i<n; i++){
        f >> pName >> m;

        Planet* p = new Planet(pName);

        for(int j = 0; j<m; j++){
            f >> sName >> sType >> shield >> armor >> guard;
            StarShip* sh;

            if(sType == "Breaker"){
                sh = new Breaker(sName, shield,armor,guard);
            } else if(sType == "Lander"){
                sh = new Lander(sName, shield,armor,guard);
            } else if(sType == "Laser"){
                sh = new Laser(sName, shield,armor,guard);
            }

            sh->Protect(p);
        }

        ss->planets.push_back(p);
    }

    StarShip* ship;
    if(ss->MaxFirepower(ship)){
        std::cout << ship->_name << std::endl;
    }

    for(Planet* p:ss->planets){
        if(p == "Earth"){
            std::cout << p->TotalShields() << std::endl;
        }
    }

    std::cout << ss->Defenseless()->name << " is defenseless!" << std::endl;
}
