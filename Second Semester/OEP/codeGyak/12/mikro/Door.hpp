#pragma once

#include "Signal.hpp"

class Microwave;

enum DoorState {opened, closed};

class Door{

    Microwave* micro;

    DoorState state = closed;

public:
    Door(Microwave* m) : micro(m) {}
    void open();
    void close();
}
