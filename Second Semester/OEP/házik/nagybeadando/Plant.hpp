#pragma once

#include <string>
#include "Radiant.hpp"
#include "Planet.hpp"

class Planet;
class Radiant;

class Plant{
protected:
    std::string name;
    int nutrient;
    Planet* planet;
    Plant (Planet* p, const std::string s, int n = 0) : planet(p), name(s), nutrient(n) {}

public:
    bool isAlive() const {return nutrient > 0;}
    void changeNutrient(int x) {nutrient += x;}
    int getNut() {return nutrient;}
    std::string getName() {return name;}
    virtual bool isPuffancs() const {return false;}
    virtual bool isDeltafa() const {return false;}
    virtual bool isParabokor() const {return false;}
    virtual void TransMute(Radiant* rad) = 0;
    virtual ~Plant();
    static Plant* create(Planet* p, const std::string name, char c, int n);
};

class Puffancs : public Plant{
public:
    Puffancs(Planet* p, const std::string name, int n = 0) : Plant(p, name, n) {}
    bool isPuffancs() const override {return true;}
    void transMute(Radiant* rad) override{
        rad->TransForm(this);
        rad->setPlanet(planet);
    }
};

class Deltafa: public Plant{
public:
    Deltafa(Planet* p, const std::string name, int n = 0) : Plant(p, name, n) {}
    bool isDeltafa() const override {return true;}
    void transMute (Radiant* rad) override{
        rad->TransForm(this);
        rad->setPlanet(planet);
    }
};

class Parabokor : public Plant{
public:
    Parabokor(Planet* p, const std::string name, int n = 0) : Plant(p, name, n) {}
    bool isParabokor() const override {return true;}
    void transMute(Radiant* rad) override{
        rad->TransForm(this);
        rad->setPlanet(planet);
    }
};
