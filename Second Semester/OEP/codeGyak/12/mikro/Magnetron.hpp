#pragma once

#include "Signal.hpp"

class Microwave;

enum MagnetronState {on, off};

class Magnetron{

    Microwave* micro;

    MagnetronState = off;

public:
    Magnetron(Microwave* m) : micro(m) {}
    void send(Signal sig);

}
