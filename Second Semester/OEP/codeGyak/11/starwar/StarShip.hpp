#pragma once

#include "Planet.hpp"

class StarShip{
public:
    std::string _name;
    int _shield;
    int _armor;
    int _spaceguard;
    Planet* _planet;

    StarShip(std::string name, int shield, int armor, int guard) : _name(name), _shield(shield), _armor(armor), _spaceguard(guard) {}
    virtual ~StarShip(){}

    void Protect(Planet* p){
        _planet = p;
        p->ships.push_back(this);
    }

    virtual int Firepower() const = 0;
};

class Breaker : public StarShip
{
public:
    Breaker(std::string name, int shield, int armor, int guard) : StarShip(name, shield, armor, guard) {}
    int Firepower() const override {return _armor/2;}
};

class Lander : public StarShip
{
public:
    Breaker(std::string name, int shield, int armor, int guard) : StarShip(name, shield, armor, guard) {}
    int Firepower() const override {return _spaceguard;}
};

class Laser : public StarShip
{
public:
    Breaker(std::string name, int shield, int armor, int guard) : StarShip(name, shield, armor, guard) {}
    int Firepower() const override {return _shield;}
};
