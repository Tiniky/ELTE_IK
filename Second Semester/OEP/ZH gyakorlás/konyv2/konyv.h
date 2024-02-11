#pragma once
#include "konyvtar.h"
#include "konyv.h"
#include "kolcson.h"
#include "mufaj.h"
#include "szemely.h"
#include <string>
#include <iostream>
class Kolcson;
class Konyvtar;
class Mufaj;
class Szemely;

using namespace std;

class Konyv{
    private:
        int azon, oldal;
        string cim, szerzo;
        bool kinn;
        Mufaj*mufaj;
        Kolcson* fej;

    public:
        Konyv()=default;
        Konyv(string cim, string szerzo,int oldal, Mufaj* mufaj):azon(0), szerzo(szerzo),oldal(oldal),mufaj(mufaj),cim(cim), fej(0),kinn(false){}
        int Dij(int ma);
        ~Konyv();

        void set_azon(int azon){this->azon=azon;}
        int get_azon(){ return azon;}
        bool get_kinn(){ return kinn;}
        void set_kinn(bool k) {kinn=k; }
        Kolcson* get_fej(){ return fej;}
        void set_fej(Kolcson*k ){fej=k;}
        string get_cim(){return cim;}
        string get_szerzo(){return szerzo;}
        int get_oldal(){return oldal;}
        Mufaj* get_mufaj(){return mufaj;}
};