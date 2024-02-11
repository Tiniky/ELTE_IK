#pragma once
#include "rendeles.h"
#include "kivansag.h"
#include "meret.h"
#include "iz.h"
#include "fagyizo.h"
#include "cukraszda.h"

#include <vector>
#include <string>
class Fagyizo;
class Cukraszda;
class Kivansag;
class Meret;
class Rendeles;

using namespace std;

class Kehely{

    private:
        vector<Iz> gomboc;
        Meret* meret;

    public:
        Kehely(Meret* m, vector<Iz> i);
        Meret* get_meret()
        {
            return meret;
        }
};