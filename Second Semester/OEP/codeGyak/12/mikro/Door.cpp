#include "Door.hpp"
#include "Signal.hpp"
#include "Microwave.hpp"

void Door::open(){
    if(state == closed){
        state = opened;
        micro->magnetron->send(Signal::open);
        micro->lamp->send(Signal::open);
    }
}

void Door::close(){
    if(state == opened){
        state = closed;
        micro->lamp->send(Signal::close);
    }
}
