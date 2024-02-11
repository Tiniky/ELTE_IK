#pragma once

#include <string>
#include <vector>

class Starship;

class Planet{
public:
    std::string name;
    std::vector<StarShip*> ships;

    Planet(std::string n) : name(n){}
    bool MaxFirepower(int &maxFp, StarShip* &ship) const;
    int TotalShields() const;

    ~Planet();
};
