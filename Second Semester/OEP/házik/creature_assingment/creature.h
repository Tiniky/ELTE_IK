//Author:   Gregorics Tibor
//Date:     2017.12.15.
//Task:     classes of creatures

#pragma once

#include <fstream>
#include <string>
#include "ground.h"

// class of abstract creatures
class Creature{
protected:
    std::string _name;
    int _power;
    Creature (const std::string &str, int e = 0) :_name(str), _power(e) {}
public:
    std::string name() const { return _name; }
    bool alive() const { return _power > 0; }
    void changePower(int e) { _power += e; }
    virtual void transmute(Ground* &court) = 0;
    virtual ~Creature () {}
    static Creature* create(char ch, const std::string name, int p);
};

// class of green finches
class Greenfinch : public Creature {
public:
    Greenfinch(const std::string &str, int e = 0) : Creature(str, e){}
    void transmute(Ground* &court) override {
        court = court->change(this);
    }
};

// class of dune beetles
class DuneBeetle : public Creature {
public:
    DuneBeetle(const std::string &str, int e = 0) : Creature(str, e){}
    void transmute(Ground* &court) override {
        court = court->change(this);
    }
};

// class of squelchies
class Squelchy : public Creature {
public:
    Squelchy(const std::string &str, int e = 0) : Creature(str, e){}
    void transmute(Ground* &court) override{
        court = court->change(this);
    }
};

