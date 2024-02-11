#include "kehely.h"

Kehely::Kehely(Meret* m, vector<Iz> i){
    if(i.size()<3 ||i.size()>5)
    {
        throw exception();
    }
    gomboc=i;
    meret=m;
}