#pragma once

#include <string>
#include <vector>

class Szemely{
public:
    std::string nev;
    vector<Kolcson*> kolcs;
    Konyvtar* konyvtar;

    Szemely(string n): nev(n) {}

    void setKonyvtar(Konyvtar* k){ this.konyvtar = k;}
    string getNev(){ return nev;}

    void Rogzit(Kolcson* k){
        kolcs.push_back(k);
    }
};
