#include "Planet.hpp"
#include <string>

Plant* Plant::create(Planet* p, const std::string name, char c, int n){
    switch(c){
        case 'p': return new Puffancs(p, name, n);
        case 'd': return new Deltafa(p, name, n);
        case 'b': return new Parabokor(p, name, n);
    }
    return nullptr;
}
