#pragma once

#include <string>

class Puffancs;
class Deltafa;
class Parabokor;

class Radiant{
public:
    virtual int change(int need, Puffancs *p) = 0;
    virtual int change(int need, Deltafa *p) = 0;
    virtual int change(int need, Parabokor *p) = 0;
    virtual ~Radiant() {}
    static Radiant* create();
};

class Alpha : public Radiant{
private:
    Alpha(){}
    static Alpha* _instance;

public:
    static Alpha* Instance();
    int change(int need, Puffancs *p) override;
    int change(int need, Deltafa *p) override;
    int change(int need, Parabokor *p) override;

    void static destroy() {
        if ( nullptr!=_instance ) {
            delete _instance;
            _instance = nullptr;
        }
    }
};

class Delta : public Radiant{
private:
    Delta(){}
    static Delta* _instance;

public:
    static Delta* Instance();
    int change(int need, Puffancs *p) override;
    int change(int need, Deltafa *p) override;
    int change(int need, Parabokor *p) override;

    void static destroy() {
        if ( nullptr!=_instance ) {
            delete _instance;
            _instance = nullptr;
        }
    }
};

class NoRad : public Radiant{
private:
    NoRad(){}
    static NoRad* _instance;

public:
    static NoRad* Instance();
    int change(int need, Puffancs *p) override;
    int change(int need, Deltafa *p) override;
    int change(int need, Parabokor *p) override;

    void static destroy() {
        if ( nullptr!=_instance ) {
            delete _instance;
            _instance = nullptr;
        }
    }
};
