//Author:   Gregorics Tibor
//Date:     2017.12.15.
//Task:     classes of groundtypes (with visitor design pattern)

#pragma once

#include <string>

class Greenfinch;
class DuneBeetle;
class Squelchy;

// class of abstract grounds
class Ground{
public:
    virtual Ground* change(Greenfinch *p) = 0;
    virtual Ground* change(DuneBeetle *p) = 0;
    virtual Ground* change(Squelchy   *p) = 0;
    virtual ~Ground() {}
    static Ground* create(int k);
};

// class of sand
class Sand : public Ground
{
public:
    static Sand* instance();
    Ground* change(Greenfinch *p) override;
    Ground* change(DuneBeetle *p) override;
    Ground* change(Squelchy   *p) override;
    void static destroy() { if ( nullptr!=_instance ) delete _instance; _instance = nullptr; }
private:
    Sand(){}
    static Sand* _instance;
};

// class of grass
class Grass : public Ground
{
public:
    static Grass* instance();
    Ground* change(Greenfinch *p) override;
    Ground* change(DuneBeetle *p) override;
    Ground* change(Squelchy   *p) override;
    static void destroy() { if ( nullptr!=_instance ) delete _instance; _instance = nullptr; }
private:
    Grass(){}
    static Grass* _instance;
};

// class of marsh
class Marsh : public Ground
{
public:
    static Marsh* instance();
    Ground* change(Greenfinch *p) override;
    Ground* change(DuneBeetle *p) override;
    Ground* change(Squelchy   *p) override;
    void static destroy() { if ( nullptr!=_instance ) delete _instance; _instance = nullptr; }
private:
    Marsh(){}
    static Marsh* _instance;
};
