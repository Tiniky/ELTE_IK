#include "plants.hpp"

Potato* Potato::_inst = nullptr;
Potato* Potato::inst(){
    if(_inst == nullptr){
        _inst = new Potato();
    }
    return _inst;
}

void Potato::destroy()
{
    if(_inst != nullptr){
        delete _inst;
        _inst = nullptr;
    }
}

Pea* Pea::_inst = nullptr;
Pea* Pea::inst(){
    if(_inst == nullptr){
        _inst = new Pea();
    }
    return _inst;
}

void Pea::destroy()
{
    if(_inst != nullptr){
        delete _inst;
        _inst = nullptr;
    }
}

Onion* Onion::_inst = nullptr;
Onion* Onion::inst(){
    if(_inst == nullptr){
        _inst = new Onion();
    }
    return _inst;
}

void Onion::destroy()
{
    if(_inst != nullptr){
        delete _inst;
        _inst = nullptr;
    }
}

Rose* Rose::_inst = nullptr;
Rose* Rose::inst(){
    if(_inst == nullptr){
        _inst = new Rose();
    }
    return _inst;
}

void Rose::destroy()
{
    if(_inst != nullptr){
        delete _inst;
        _inst = nullptr;
    }
}

Carnation* Carnation::_inst = nullptr;
Carnation* Carnation::inst(){
    if(_inst == nullptr){
        _inst = new Carnation();
    }
    return _inst;
}

void Carnation::destroy()
{
    if(_inst != nullptr){
        delete _inst;
        _inst = nullptr;
    }
}

Tulip* Tulip::_inst = nullptr;
Tulip* Tulip::inst(){
    if(_inst == nullptr){
        _inst = new Tulip();
    }
    return _inst;
}

void Tulip::destroy()
{
    if(_inst != nullptr){
        delete _inst;
        _inst = nullptr;
    }
}
