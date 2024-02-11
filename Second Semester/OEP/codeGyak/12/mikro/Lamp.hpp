#pragma once

#include "Signal.hpp"

class Microwave;

enum LampState {lit, notLit};

class Lamp{

    Microwave* micro;

    LampState state = notLit;

public:
    Lamp(Microwave* m) : micro(m) {}
    void send(Signal sig);

};
