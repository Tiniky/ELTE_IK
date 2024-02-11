#include "Lamp.hpp"
#include "Signal.hpp"
#include "Microwave.hpp"

void Lamp::send(Signal sig){
    switch(sig){
    case open:
        state = lit;
        break;
    case close:
        state = notLit;
        break;
    case start:
        state = lit;
        break;
    case stop:
        state = notLit;
        break;
    default:
        break;
    }
}
