#pragma once

#include <string>

class Puffancs;
class Deltafa;
class Parabokor;

class Radiant{
public:
    virtual int transForm(int need, Puffancs *p) = 0;
    virtual int transForm(int need, Deltafa *p) = 0;
    virtual int transForm(int need, Parabokor *p) = 0;
    virtual bool isAlpha() const {return false;}
    virtual bool isDelta() const {return false;}
    virtual bool isNoRad() const {return false;}
    virtual ~Radiant() {}
    static Radiant* create();
};

class Alpha : public Radiant{
private:
    Alpha(){}
    static Alpha* _instance;

public:
    static Alpha* Instance();
    int transForm(int need, Puffancs *p) override;
    int transForm(int need, Deltafa *p) override;
    int transForm(int need, Parabokor *p) override;
    bool isAlpha() const override {return true;}

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
    int transForm(int need, Puffancs *p) override;
    int transForm(int need, Deltafa *p) override;
    int transForm(int need, Parabokor *p) override;
    bool isDelta() const override {return true;}

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
    int transForm(int need, Puffancs *p) override;
    int transForm(int need, Deltafa *p) override;
    int transForm(int need, Parabokor *p) override;
    bool isNoRad() const override {return true;}

    void static destroy() {
        if ( nullptr!=_instance ) {
            delete _instance;
            _instance = nullptr;
        }
    }
};
