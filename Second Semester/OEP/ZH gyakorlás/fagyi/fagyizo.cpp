#include "fagyizo.h"

void Fagyizo::Felvesz(vector<Kivansag> /*&*/list,string t){
            Rendeles* r = new Rendeles(t);
            for(Kivansag e : list)
            {
                Meret* m = Meret::Atalakit(e.get_meret());
                r->Hozzavesz(new Kehely(m,e.get_iz()));                
            }
            napi.push_back(r);
        }