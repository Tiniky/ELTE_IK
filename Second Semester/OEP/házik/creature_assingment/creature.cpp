//Author:   Gregorics Tibor
//Date:     2017.12.15.
//Task:     implementation of the static method of the class Creature

#include "creature.h"

Creature* Creature::create(char ch, const std::string name, int p)
{
    switch (ch)
    {
        case 'G': return new Greenfinch(name, p);
        case 'D': return new DuneBeetle(name, p);
        case 'S': return new Squelchy(name, p);
    }
    return nullptr;
}
