#pragma once

#include <string>
#include "Plant.hpp"
#include "Planet.hpp"


class Puffancs;
class Deltafa;
class Parabokor;


class Radiant{
private:

public:
    Radiant() {}
    Planet* planet;
    void setPlanet(Planet* p) {planet = p;}
    virtual void TransForm(Puffancs* p);
    virtual void TransForm(Deltafa* d);
    virtual void TransForm(Parabokor* b);
    virtual ~Radiant() {}
};

class Alfa : public Radiant{
private:
    static Alfa* _instance;

public:
    Alfa() {}
    static Alfa* Instance();
    void static destroy(){
        if(_instance != nullptr){
            delete _instance;
            _instance = nullptr;
        }
    }
    void TransForm(Puffancs* p) override;
    void TransForm(Deltafa* d) override;
    void TransForm(Parabokor* b) override;
};

class Delta : public Radiant{
private:
    static Delta* _instance;

public:
    Delta() {}
    static Delta* Instance();
    void static destroy(){
        if(_instance != nullptr){
            delete _instance;
            _instance = nullptr;
        }
    }
    void TransForm(Puffancs* p) override;
    void TransForm(Deltafa* d) override;
    void TransForm(Parabokor* b) override;
};

class NoRad : public Radiant{
private:
    static NoRad* _instance;

public:
    NoRad() {}
    static NoRad* Instance();
    void static destroy(){
        if(_instance != nullptr){
            delete _instance;
            _instance = nullptr;
        }
    }
    void TransForm(Puffancs* p) override;
    void TransForm(Deltafa* d) override;
    void TransForm(Parabokor* b) override;
};
