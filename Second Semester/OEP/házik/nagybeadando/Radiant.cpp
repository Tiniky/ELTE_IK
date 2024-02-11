#include "Radiant.hpp"
#include "Planet.hpp"
#include "Plant.hpp"

Alfa* Alfa::_instance = nullptr;
Alfa* Alfa::Instance(){
    if(_instance == nullptr){
        _instance = new Alfa();
    }
    return _instance;
}

void Alfa::TransForm(Puffancs *p){
    p->changeNutrient(3);
    planet->alfaAdd(10);
}

void Alfa::TransForm(Deltafa* d){
    d->changeNutrient(-3);
    if(d->getNut() < 5){
        planet->deltaAdd(4);
    } else if(d->getNut() >=5 && d->getNut() <=10){
        planet->deltaAdd(1);
    }
}

void Alfa::TransForm(Parabokor *b){
    b->changeNutrient(1);
}

Delta* Delta::_instance = nullptr;
Delta* Delta::Instance(){
    if(_instance == nullptr){
        _instance = new Delta();
    }
    return _instance;
}

void Delta::TransForm(Puffancs *p){
    p->changeNutrient(-2);
    planet->alfaAdd(10);
}

void Delta::TransForm(Deltafa* d){
    d->changeNutrient(4);
    if(d->getNut() < 5){
        planet->deltaAdd(4);
    } else if(d->getNut() >=5 && d->getNut() <=10){
        planet->deltaAdd(1);
    }
}

void Delta::TransForm(Parabokor *b){
    b->changeNutrient(1);
}

NoRad* NoRad::_instance = nullptr;
NoRad* NoRad::Instance(){
    if(_instance == nullptr){
        _instance = new NoRad();
    }
    return _instance;
}

void NoRad::TransForm(Puffancs *p){
    p->changeNutrient(-1);
    planet->alfaAdd(10);
}

void NoRad::TransForm(Deltafa* d){
    d->changeNutrient(-1);
    if(d->getNut() < 5){
        planet->deltaAdd(4);
    } else if(d->getNut() >=5 && d->getNut() <=10){
        planet->deltaAdd(1);
    }
}

void NoRad::TransForm(Parabokor *b){
    b->changeNutrient(-1);
}
