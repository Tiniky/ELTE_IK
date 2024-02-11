#pragma once

class Kolcson;

class Mufaj{
public:
    virtual int Dij() const = 0;
};

class TermeszetTudomanyos : public Mufaj{
private:
    TermeszetTudomanyos(){};
    static TermeszetTudomanyos* _instance;
    Kolcson* fej;

public:
    int Dij() const override {return 100;}

    static TermeszetTudomanyos* Instance(){
        if(_instance == nullptr){
            _instance = new TermeszetTudomanyos();
        }
        return _instance;
    }

    void static Destroy() {
        if(nullptr!=_instance ) {
            delete _instance;
        }
    }
};

class Szepirodalmi : public Mufaj{
private:
    Szepirodalmi(){};
    static Szepirodalmi* _instance;

public:
    int Dij() const override {return 50;}
    static Szepirodalmi* Instance(){
        if(_instance == nullptr){
            _instance = new Szepirodalmi();
        }
        return _instance;
    }

    void static Destroy() {
        if(nullptr!=_instance ) {
            delete _instance;
        }
    }
};

class Ifjusagi : public Mufaj{
private:
    Ifjusagi(){};
    static Ifjusagi* _instance;

public:
    int Dij() const override {return 20;}
    static Ifjusagi* Instance(){
        if(_instance == nullptr){
            _instance = new Ifjusagi();
        }
        return _instance;
    }

    void static Destroy() {
        if(nullptr!=_instance ) {
            delete _instance;
        }
    }
};
