#pragma once
#include "rendeles.h"
#include "kivansag.h"
#include "meret.h"
#include "iz.h"
#include "kehely.h"
#include "cukraszda.h"

#include <vector>
#include <string>

class Meret;
class Kivansag;
class Cukraszda;
class Kehely;
class Rendeles;

using namespace std;

class Fagyizo{
    private:
        string nev,cim;
        int ar;
        vector<Rendeles*> napi;
    public:
        Fagyizo(string n, string c,int ar):nev(n),cim(c),ar(ar){}
        ~Fagyizo(){}

        void Felvesz(vector<Kivansag> /*&*/list,string t);

        vector<Rendeles*> get_napi(){return napi;}
        string get_cim(){ return cim;}
        string get_nev(){return nev;}
        int get_ar(){return ar;}

};