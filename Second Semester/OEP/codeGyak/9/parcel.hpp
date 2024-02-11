#pragma once

#include "plants.hpp"
#include <iostream>

class Parcel{
private:
    Plant* _p;
    int plantingDate;

public:
    Parcel() : _p(nullptr), plantingDate(0) {}

    void plant(Plant *p, int date){
        if(_p == nullptr){
            _p = p;
            plantingDate = date;
        } else{
            std::cout << "Plant already planted here!" << std::endl;
        }
    }

    void harvest() {_p = nullptr;}

    bool isRipe(int month){
        if(_p != nullptr && (month - plantingDate) == _p->getRipeningTime()){
            return true;
        }
        return false;
    }
};
