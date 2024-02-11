#include "konyvtar.h"

void Konyvtar::Bevetelez(Konyv* k)
{
    k->set_azon(c);
    c++;
    konyvek.push_back(k);
    
}

void Konyvtar::Belep(Szemely* &sz){
    if(!Tag(sz))
    {
        tagok.push_back(sz);
        sz->set_konyvtar(this);
    }

}

bool Konyvtar::Tag(Szemely* sz)
{
    for(Szemely*  e : tagok)
    {
        if(e->get_nev()==sz->get_nev())
        {
            return true;
        }

    }
    return false;
}

bool Konyvtar::Keres(int az,Konyv* &k)
{
    bool van=false;
    for(Konyv* e : konyvek)
    {
        if(e->get_azon()==az)
        {
            k=e;
            van=true;
            return true;
        }
    }
    return van;
}

void Konyvtar::Kolcsonoz(Szemely* &sz, vector<int> lista, int ma)
{
    if(!Tag(sz) && lista.size()>5) { throw exception();}
    Kolcson* kg = new Kolcson(this,sz,ma);
    Konyv* k;
    
    for(int az : lista)
    {
        bool van=false;
        van=this->Keres(az,k);
        if(van && !k->get_kinn())
        {
            kg->get_tetelek().push_back(k);
            k->set_kinn(true);
            k->set_fej(kg);
        }
    }
    kolcs.push_back(kg);
    sz->Rogzit(kg);

}