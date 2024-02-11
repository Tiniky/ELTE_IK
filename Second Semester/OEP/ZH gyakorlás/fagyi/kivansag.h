#pragma once
#include "rendeles.h"
#include "kehely.h"
#include "meret.h"
#include "iz.h"
#include "fagyizo.h"
#include "cukraszda.h"

#include <vector>
#include <string>

class Meret;
class Fagyizo;
class Cukraszda;
class Kehely;
class Rendeles;

using namespace std;

class Kivansag{
        
    public:
        string meret;
        vector<Iz> i;
        Kivansag()=default;
        ~Kivansag(){}

        vector<Iz> get_iz(){return i;}
        string get_meret(){return meret;}

};