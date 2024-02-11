#pragma once
#include "konyvtar.h"
#include "konyv.h"
#include "kolcson.h"
#include "mufaj.h"
#include "szemely.h"
#include <string>
#include <iostream>
#include <vector>

using namespace std;
class Mufaj;
class Konyvtar;
class Konyv;
class Szemely;

class Kolcson{
    private:
        int datum;
        Konyvtar* konyvtar;
        Szemely* tag;
        vector<Konyv*> tetelek;

    public:
        Kolcson(Konyvtar* k, Szemely* sz, int d): datum(d),konyvtar(k),tag(sz){}
        ~Kolcson(){}

        //**********

        
        vector<Konyv*> &get_tetelek(){ return tetelek; }
        int get_datum(){return datum;}

};