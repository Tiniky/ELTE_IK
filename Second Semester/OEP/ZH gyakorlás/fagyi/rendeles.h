#pragma once
#include "kehely.h"
#include "kivansag.h"
#include "meret.h"
#include "iz.h"
#include "fagyizo.h"
#include "cukraszda.h"

#include <vector>
#include <string>

class Meret;
class Fagyizo;
class Kivansag;
class Kehely;
class Cukraszda;

using namespace std;

class Rendeles{
    private:
        vector<Kehely*> kelyhek;
        string idopont;
    public:
        Rendeles(string t):idopont(t){}
        void Hozzavesz(Kehely* k){
            kelyhek.push_back(k);
        }
        vector<Kehely*> get_kelyhek(){return kelyhek;}
        string get_idopont()
        {
            return idopont;
        }


};