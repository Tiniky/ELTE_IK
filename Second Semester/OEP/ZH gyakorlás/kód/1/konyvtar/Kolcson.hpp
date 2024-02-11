#pragma once

#include <vector>
#include "Konyvtar.hpp"
#include "Konyv.hpp"
#include "Szemely.hpp"

class Kolcson{
public:
    int datum;
    Konyvtar* konyvtar;
    Szemely* tag;
    std::vector <Konyv*> tetelek;

    Kolcson(Konyvtar* k, Szemely* sz, int d): datum(d), konyvtar(k), tag(sz) {}
    int getDatum() {return datum;}

    ~Kolcson(){}
};
