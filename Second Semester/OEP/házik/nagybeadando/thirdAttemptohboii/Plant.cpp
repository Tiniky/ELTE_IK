#include "Plant.hpp"

Plant* Plant::create(const std::string name, char c, int n)
{
    switch (c)
    {
        case 'p': return new Puffancs(name, n);
        case 'd': return new Deltafa(name, n);
        case 'b': return new Parabokor(name, n);
    }

    return nullptr;
}
