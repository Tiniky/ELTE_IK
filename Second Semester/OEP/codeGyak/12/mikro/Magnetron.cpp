#include "Magnetron.hpp"
#include "Signal.hpp"
#include "Microwave.hpp"

void Magnetron::send(Signal sig){
    if(state == on){
        switch(sig){
        case press:
            state = off;
            micro->lamp->send(Signal stop);
            break;
        case open:
            state = off;
            break;
        default:
            break;
        }
    } else if(state == off){
        switch(sig){
        case press:
            state = on;
            micro->lamp->send(Signal start);
            break;
        default:
            break;
        }
    }
}
