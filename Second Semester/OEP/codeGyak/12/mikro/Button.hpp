#pragma once

#include "Signal.hpp"

class Microwave;

class Button{

    Microwave* micro;

public:
    Button(Microwave* m) : micro(m) {}

    void press();

}
