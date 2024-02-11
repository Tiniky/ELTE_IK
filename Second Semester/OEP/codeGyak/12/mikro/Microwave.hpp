#pragma once

#include "Magnetron.hpp"
#include "Lamp.hpp"
#include "Door.hpp"
#include "Button.hpp"

class Microwave{
public:
    Magnetron* magnetron;
    Lamp* lamp;
    Door* door;
    Button* button;

    Microwave(){
        magnetron = new Magnetron(this);
        lamp = new Lamp(this);
        door = new Door(this);
        button = new Button(this);
    }

    ~Microwave(){
        delete magnetron;
        delete lamp;
        delete door;
        delete button;
    }


};
