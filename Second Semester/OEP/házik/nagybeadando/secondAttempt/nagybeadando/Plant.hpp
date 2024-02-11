#pragma once

#include <fstream>
#include <string>
#include "Radiant.hpp"


class Plant{
protected:
    std::string name;
    int nutrient;
    Plant (const std::string &s, int n = 0) :name(s), nutrient(n) {}
public:
    std::string getName() const { return name; }
    bool isAlive() const { return nutrient > 0; }
    void changeNut(int n) { nutrient += n; }
    int getNut() {return nutrient;}
    virtual bool isPuffancs() const {return false;}
    virtual bool isDeltafa() const {return false;}
    virtual bool isParabokor() const {return false;}
    virtual int transMute(int need, Radiant* &rad) = 0;
    virtual ~Plant () {}
    static Plant* create(const std::string name, char c,  int x);
};

class Puffancs : public Plant {
public:
    Puffancs(const std::string &s, int n = 0) : Plant(s, n){}
    bool isPuffancs() const override {return true;}
    int transMute(int need, Radiant* &rad) override {
        return rad->change(need, this);
    }
};

class Deltafa : public Plant {
public:
    Deltafa(const std::string &s, int n = 0) : Plant(s, n){}
    bool isDeltafa() const override {return true;}
    int transMute(int need, Radiant* &rad) override {
        return rad->change(need, this);
    }
};

class Parabokor : public Plant {
public:
    Parabokor(const std::string &s, int n = 0) : Plant(s, n){}
    bool isParabokor() const override {return true;}
    int transMute(int need, Radiant* &rad) override{
        return rad->change(need, this);
    }
};
