#pragma once
#include "rendeles.h"
#include "kivansag.h"
#include "meret.h"
#include "iz.h"
#include "fagyizo.h"
#include "kehely.h"

#include <vector>
#include <string>

class Meret;
class Fagyizo;
class Kivansag;
class Kehely;
class Rendeles;

using namespace std;

class Cukraszda{

    private:    
        vector<Fagyizo*> uzletek;
    public:
        void Nyit(Fagyizo* u);
        vector<Fagyizo*> get_uzletek(){return uzletek;}
        

};