#pragma once
#include "konyvtar.h"
#include "konyv.h"
#include "kolcson.h"
#include "mufaj.h"
#include "szemely.h"
#include <string>
#include <iostream>
#include <vector>
class Mufaj;
class Kolcson;
class Konyv;
class Szemely;

using namespace std;

class Konyvtar{

    private:
        vector<Kolcson*> kolcs;
        vector<Konyv*> konyvek;
        vector<Szemely*> tagok;
        int c;
    public:
        Konyvtar():c(1){}
        void Bevetelez(Konyv* k);
        void Belep(Szemely* &sz);
        bool Tag(Szemely* sz);
        bool Keres(int az,Konyv* &k);
        void Kolcsonoz(Szemely* &sz, vector<int> lista, int ma);


        
        vector<Konyv*> get_konyvek(){return konyvek;}
        vector<Kolcson*> get_kolcs(){return kolcs;}
        vector<Szemely*> get_tagok(){return tagok;}
    
    

};