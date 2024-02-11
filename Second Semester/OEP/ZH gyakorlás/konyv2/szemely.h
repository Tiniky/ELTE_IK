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
class Kolcson;
class Konyvtar;
class Mufaj;
class Konyv;



class Szemely{
    private:
        string nev;
        vector<Kolcson*> kolcs;
        Konyvtar* konyvtar;

    public:
        Szemely(string n):nev(n){}
        void Rogzit(Kolcson*k);


        void set_konyvtar(Konyvtar* k){ konyvtar = k;}
        string get_nev(){ return nev;}
        vector<Kolcson*> get_kolcs(){return kolcs;}
        Konyvtar* get_konyvtar(){return konyvtar;}


};