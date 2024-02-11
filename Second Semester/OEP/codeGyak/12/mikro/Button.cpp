#include "Button.hpp"
#include "Signal.hpp"
#include "Microwave.hpp"

void Button::press(){
    micro->magnetron->send(Signal::press)
}
