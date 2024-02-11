#pragma once
#include "konyvtar.h"
#include "konyv.h"
#include "kolcson.h"
#include "mufaj.h"
#include "szemely.h"
#include <string>
#include <iostream>

using namespace std;

class Kolcson;
class Konyvtar;
class Konyv;
class Szemely;

class Mufaj{

    public:
        virtual int Dij()=0;
        virtual ~Mufaj()=default;
};

class Termeszettudomanyos : public Mufaj{
    private:
        static Termeszettudomanyos* _instance;
        Termeszettudomanyos(){}
        Kolcson* fej;
    public:
        static Termeszettudomanyos* instance(){
            if(_instance==nullptr)
            {
                _instance= new Termeszettudomanyos();
            }
            return _instance;
        }
        static void destroy(){
            if(_instance!=nullptr)
            {
                delete _instance;
            }
            _instance=nullptr;
        }
        int Dij() override{
            return 100;
        }
};

class Szepirodalmi : public Mufaj{
    private:
        static Szepirodalmi* _instance;
        Szepirodalmi(){}
    public:
        static Szepirodalmi* instance(){
            if(_instance==nullptr)
            {
                _instance= new Szepirodalmi();
            }
            return _instance;
        }
        static void destroy(){
            if(_instance!=nullptr)
            {
                delete _instance;
            }
            _instance=nullptr;
        }
        int Dij() override{
            return 50;
        }
};


class Ifjusagi : public Mufaj{
    private:
        static Ifjusagi* _instance;
        Ifjusagi(){}
        Kolcson* fej;
    public:
        static Ifjusagi* instance(){
            if(_instance==nullptr)
            {
                _instance= new Ifjusagi();
            }
            return _instance;
        }
        static void destroy(){
            if(_instance!=nullptr)
            {
                delete _instance;
            }
            _instance=nullptr;
        }
        int Dij() override{
            return 20;
        }
};