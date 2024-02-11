#include "Konyvtar.hpp"
#include "Konyv.hpp"
#include "Kolcson.hpp"
#include "Mufaj.hpp"
#include "Szemely.hpp"

#include <iostream>


int testCounter = 1;
bool jo = true;

void check(bool l)
{
    if(!l)
    {
        jo = false;
        std::cerr<<testCounter<<". teszt sikertelen."<<std::endl;
    }
    testCounter++;
}

int main()
{

    Konyvtar* konyvtar = new Konyvtar();

    Konyv* konyv1 = new Konyv("Cim1","Szerzo1",100,TermeszetTudomanyos::instance());
    Konyv* konyv2 = new Konyv("Cim2","Szerzo2",200,Szepirodalmi::instance());

    Szemely* szemely1 = new Szemely("Szemely1");

    konyvtar->Bevetelez(konyv1);
    check(konyvtar->konyvek().size() == 1);
    check(konyvtar->konyvek()[0] == konyv1);
    konyvtar->Bevetelez(konyv2);

    check(konyvtar->get_konyvek()[0]->get_azon() == 1);
    check(konyvtar->get_konyvek()[0]->get_cim() == "Cim1");
    check(konyvtar->get_konyvek()[0]->get_szerzo() == "Szerzo1");
    check(konyvtar->get_konyvek()[0]->get_oldal() == 100);
    check(konyvtar->get_konyvek()[0]->get_kinn() == false);
    check(konyvtar->get_konyvek()[0]->get_mufaj() == TermeszetTudomanyos::Instance());

    konyvtar->Belep(szemely1);
    check(szemely1->konyvtar == konyvtar);
    check(konyvtar->tagok().size() == 1);
    check(konyvtar->tagok()[0]->getNev() == "Szemely1");

    konyvtar->Kolcsonoz(szemely1,{1,2},0);
    check(konyv1->kinn() == true);
    check(szemely1->kolcs()[0]->tetelek()[0] == konyv1);
    check(szemely1->kolcs()[0]->tetelek().size() == 2);
    check(konyv1->fej() == konyvtar->kolcs()[0]);


    check(konyv1->get_mufaj()->Dij() == 100);
    check(konyv2->get_mufaj()->Dij() == 50);

    TermeszetTudomanyos::Destroy();
    Szepirodalmi::Destroy();
    Ifjusagi::Destroy();

    if (!jo)
    {
        return 1;
    }
    else
    {
        std::cout << "Ok "  << testCounter << std::endl;
        return 0;
    }

}
