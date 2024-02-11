#pragma once

#include "garden.hpp"

class Gardner{
public:
    Garden* _g;

    Gardner(Garden g) : _g(g) {}

    void harvest(int i){
        _g->getParcel(i)->harvest();
    }

    void plant(int i, Plant* p, int date){
        _g->getParcel(i)->plant(p, date);
    }
};
