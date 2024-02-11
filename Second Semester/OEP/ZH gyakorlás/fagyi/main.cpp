#include "cukraszda.h"
#include <iostream>
#include <string>

 #include <cassert>


int main()
{
    Cukraszda* c = new Cukraszda();
    c->Nyit(new Fagyizo("Fagyizo", "Varos-Utca-Hazszam",100));

    Fagyizo* f = c->get_uzletek()[0];

    std::cout << f->get_nev() << std::endl;
    std::cout << f->get_cim() << std::endl;
    std::cout << f->get_ar() << std::endl;

    Kivansag ki1, ki2, ki3;
    ki1.i = {Iz::csoki,Iz::csoki,Iz::vanilia};
    ki1.meret = "kicsi";

    ki2.i = {Iz::csoki,Iz::eper,Iz::vanilia,Iz::eper};
    ki2.meret = "nagy";

    ki3.i = {Iz::csoki,Iz::csoki,Iz::vanilia,Iz::vanilia,Iz::eper};
    ki3.meret = "kozepes";



    std::vector<Kivansag> kList1;
    kList1.push_back(ki1);
    kList1.push_back(ki2);
    kList1.push_back(ki3);

    f->Felvesz(kList1,"10:00");
    std::cout << f->get_napi()[0]->get_idopont() << std::endl;

    Rendeles* r1 = f->get_napi()[0];
    
    Kehely* ke1 = r1->get_kelyhek()[0];
    Kehely* ke2 = r1->get_kelyhek()[1];
    Kehely* ke3 = r1->get_kelyhek()[2];


    assert(ke1->get_meret()->get_suly() == 55);
    assert(ke2->get_meret()->get_suly() == 90);
    assert(ke3->get_meret()->get_suly() == 70);

    std::cout << ke1->get_meret()->get_suly() << " - " << (ke1->get_meret() == Kicsi::instance()) << std::endl;
    std::cout << ke2->get_meret()->get_suly() << " - " << (ke2->get_meret() == Nagy::instance()) << std::endl;
    std::cout << ke3->get_meret()->get_suly() << " - " << (ke3->get_meret() == Kozepes::instance()) << std::endl;

    Kicsi::destroy();
    Kozepes::destroy();
    Nagy::destroy();
    return 0;
}

