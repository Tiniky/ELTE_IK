#pragma once

#include "rendeles.h"
#include "kivansag.h"
#include "kehely.h"
#include "iz.h"
#include "fagyizo.h"
#include "cukraszda.h"

#include <vector>
#include <string>

class Fagyizo;
class Cukraszda;
class Kivansag;
class Kehely;
class Rendeles;

using namespace std;


class Meret{
    protected:
        int suly;
    public:
        static Meret* Atalakit(string s);
        virtual int get_suly(){return suly;}
        virtual ~Meret(){}
};

class Kicsi: public Meret{
    private:
        Kicsi()
        {
            suly=55;
        }
        static Kicsi* _instance;
    public:
        static Kicsi* instance(){if(_instance==nullptr){_instance=new Kicsi();}return _instance;}
        static void destroy(){if(_instance!=nullptr){delete _instance;}_instance=nullptr;}
    
};

class Kozepes : public Meret{
    private:
        Kozepes()
        {
            suly=70;
        }
        static Kozepes* _instance;
    public:
        static Kozepes* instance(){if(_instance==nullptr){_instance=new Kozepes();}return _instance;}
        static void destroy(){if(_instance!=nullptr){delete _instance;}_instance=nullptr;}

};

class Nagy : public Meret{
    private:
        Nagy(){
            suly=90;
        }
        static Nagy* _instance;
    public:
        static Nagy* instance(){if(_instance==nullptr){_instance=new Nagy();}return _instance;}
        static void destroy(){if(_instance!=nullptr){delete _instance;}_instance=nullptr;}
};