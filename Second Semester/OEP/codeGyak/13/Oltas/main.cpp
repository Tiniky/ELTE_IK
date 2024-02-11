#include<iostream>
#include "Hospital.hpp"

int main()
{
    Hospital* h = new Hospital();
    Patient* p1 = new Patient("1");
    Patient* p2 = new Patient("2");
    Patient* p3 = new Patient("3");

    h->Procure("Pfizer");
    h->Procure("Pfizer");
    h->Procure("Pfizer");
    h->Procure("Pfizersd");

    h->Register(p1);
    h->Register(p2);
    h->Register(p2);

    h->Vaccinate(p1,"Pfizer");
    h->Vaccinate(p2,"Pfizer");
    h->Vaccinate(p2,"Pfizer");
    h->Vaccinate(p2,"Pfizer");
    h->Vaccinate(p1,"Astra");

    std::cout << h->NumOfMultiple() << std::endl;
    return 0;
}