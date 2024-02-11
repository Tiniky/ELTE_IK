#pragma once

#include <vector>
#include "Kolcson.hpp"
#include "Konyv.hpp"
#include "Szemely.hpp"

class Kolcson;
class Konyv;
class Szemely;

class Konyvtar{
private:
    bool Tag(Szemely* sz){
        for(Szemely* e : tagok){
            if(e->getNev() == sz->getNev()){
                return true;
            }
        }

        return false;
    }

    bool Keres(int az, Konyv* k) {
        bool van = false;
        for(Konyv* e : konyvek){
            if(e->getID() == az){
                k = e;
                van = true;
            }
        }
        return van;
    }

public:
    int id;
    vector<Kolcson*> kolcs;
    vector<Konyv*> konyvek;
    vector<Szemely*> tagok;

    Konyvtar(): id(1) {}

    void Bevetelez(Konyv* k){
        k->setID(id);
        id++;
        konyvek.push_back(k);
    }

    void Belep(Szemely* sz) {
        if(!Tag(sz)){
            tagok.push_back(sz);
            sz->setKonyvtar(this);
        }
    }

    void Kolcsonoz(Szemely* sz, std::vector<int> lista, int ma) {
        if(!Tag(sz) && lista.size()>5) {throw std::exception();}
        Kolcson* kg = new Kolcson(this, sz, ma);
        Konyv* k;

        for(int az : lista){
            bool van = false;
            van = this->Keres(az,k);
            if(van && !k->kinn){
                kg->tetelek.push_back(k);
                k->kinn = true;
                k->fej = kg;
            }
        }

        kolcs.push_back(kg);
        sz->Rogzit(kg);
    }

    //void Visszahoz(Szemely* sz, std::vector<int> lista) {}

    //int Potdij(Szemely* sz, int ma) {}
};
