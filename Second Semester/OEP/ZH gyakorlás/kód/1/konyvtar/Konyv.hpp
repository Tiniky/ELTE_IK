#pragma once

#include "Mufaj.hpp"
#include "Kolcson.hpp"
#include <string>


class Konyv{
public:
    int azon, oldal;
    std::string cim, szerzo;
    bool kinn;
    Mufaj* mu;
    Kolcson* fej;

    Konyv(std::string c, std::string s, int o, Mufaj* m): azon(0), cim(c), szerzo(s), oldal(o), mu(m), fej(0), kinn(false) {}

    int Dij(int ma){
        int keses = ma-(fej->getDatum() + 30);
    }

    void setID(int id){this.azon = id;}
    int getID(int id){return azon;}

    ~Konyv(){
        delete mu;
    }

};
