//Author:    Gregorics Tibor
//Date:      2017.08.08.
//Task:      race of creatures

#include <iostream>
#include <cstdlib>
#include <fstream>
#include <vector>
#include "creature.h"
#include "ground.h"

using namespace std;

// creates the population
void create(const string &str, vector<Creature*> &creatures, vector<Ground*> &courts)
{
    ifstream f(str);
    if(f.fail()) { cout << "Wrong file name!\n"; exit(1);}

    // creates creatures
    int n; f >> n;
    creatures.resize(n);
    char ch;
    std::string name;
    int p;
    for( int i=0; i<n; ++i ){
        f >> ch >> name >> p;
        creatures[i] = Creature::create(ch, name, p);
    }

    // create courts
    int m; f >> m;
    courts.resize(m);
    for( int j=0; j<m; ++j ) {
        int k; f >> k;
        courts[j] = Ground::create(k);
    }
}

// the race of creatures
void race(vector<Creature*> &creatures, vector<Ground*> &courts, vector<string>& alives)
{
    alives.clear();
    try{
        for( unsigned int i=0; i < creatures.size(); ++i ){
            for( unsigned int j=0; creatures[i]->alive() && j < courts.size(); ++j ){
                creatures[i]->transmute(courts[j]);
            }
            if ( creatures[i]->alive() ) alives.push_back(creatures[i]->name());
        }
    }catch(exception e){
        cout << e.what() << endl;
    }
}

// deletes the population
void destroyAll(vector<Creature*> &creatures)
{
    for(int i=0; i<(int)creatures.size(); ++i) delete creatures[i];
    Sand::destroy();
    Grass::destroy();
    Marsh::destroy();
}

// Ezzel lehet a manualis es a unit teszt mod kozott valtogatni
#define NORMAL_MODE
//#ifdef NORMAL_MODE


//Feladat:       Verseny rendezése különféle lények számára és a túlélő lények nameeinak kigyűjtése
//Bemenõ adatok: szöveges állomány
//Kimenõ adatok: konzolra kiírt lények nameei
//Tevékenység:   A versenyzők és a pálya létrehozása aszöveges állomány alapján
//               majd a verseny szimulálása és az eredmény kiírása
int main()
{
    vector<Creature*> creatures;
    vector<Ground*> courts;
    create("inp.txt", creatures, courts );

    // Verseny
    vector<string> alives;
    race(creatures, courts, alives);
    for(unsigned int i=0; i<alives.size(); ++i) cout << alives[i] << endl;

    // Objektumok megszüntetése
    destroyAll(creatures);

    return 0;
}

#else
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

TEST_CASE("1", "inp1*.txt")
{
    vector<Creature*> creatures;
    vector<Ground*> courts;
    vector<string> alives;

    create("inp11.txt", creatures, courts);
    race(creatures, courts, alives);
    CHECK(alives.size() == 0);
    destroyAll(creatures);

    create("inp12.txt", creatures, courts );
    race(creatures, courts, alives);
    CHECK(alives.size() == 1);
    destroyAll(creatures);

    create("inp13.txt", creatures, courts );
    race(creatures, courts, alives);
    CHECK(alives.size() == 2);
    destroyAll(creatures);

    create("inp21.txt", creatures, courts );
    race(creatures, courts, alives);
    CHECK(alives[0] == "plash");
    CHECK(alives[1] == "bug");
    destroyAll(creatures);

    create("inp22.txt", creatures, courts );
    race(creatures, courts, alives);
    CHECK(alives.size() == 0);
    destroyAll(creatures);
}

TEST_CASE("2", "inp2*.txt")
{
    vector<Creature*> creatures;
    vector<Ground*> courts;
    vector<string> alives;

    creatures.clear();
    courts.clear();
    create("inp21.txt", creatures, courts );
    race(creatures, courts, alives);

    CHECK(alives[0] == "plash");
    CHECK(alives[1] == "bug");
    destroyAll(creatures);

    create("inp22.txt", creatures, courts );
    race(creatures, courts, alives);
    CHECK(alives.size() == 0);
    destroyAll(creatures);
}

TEST_CASE("3", "") {

    vector<Creature*> creatures;
    vector<Ground*> courts;
    vector<string> alives;

    creatures.clear();
    courts.clear();
    creatures.push_back(new Greenfinch("greenish", 1));
    race(creatures, courts, alives);

    CHECK(creatures[0]->alive() == true);

    destroyAll(creatures);


    creatures.clear();
    courts.clear();
    creatures.push_back(new Greenfinch("greenish", 5));
    courts.push_back(Sand::instance()); courts.push_back(Grass::instance()); courts.push_back(Marsh::instance());
    race(creatures, courts, alives);

    CHECK(creatures[0]->alive() == true);
    CHECK(courts[0] == Sand::instance());
    CHECK(courts[1] == Grass::instance());
    CHECK(courts[2] == Grass::instance());

    destroyAll(creatures);


    creatures.clear();
    courts.clear();
    creatures.push_back(new DuneBeetle("bug", 5));
    courts.push_back(Sand::instance()); courts.push_back(Grass::instance()); courts.push_back(Marsh::instance());
    race(creatures, courts, alives);

    CHECK(creatures[0]->alive() == true);
    CHECK(courts[0] == Sand::instance());
    CHECK(courts[1] == Sand::instance());
    CHECK(courts[2] == Grass::instance());

    destroyAll(creatures);


    creatures.clear();
    courts.clear();
    creatures.push_back(new Squelchy("plash", 10));
    courts.push_back(Sand::instance()); courts.push_back(Grass::instance()); courts.push_back(Marsh::instance());
    race(creatures, courts, alives);

    CHECK(creatures[0]->alive() == true);
    CHECK(courts[0] == Sand::instance());
    CHECK(courts[1] == Marsh::instance());
    CHECK(courts[2] == Marsh::instance());

    destroyAll(creatures);


    creatures.clear();
    courts.clear();
    creatures.push_back(new Squelchy("plash", 5));
    courts.push_back(Sand::instance()); courts.push_back(Grass::instance()); courts.push_back(Marsh::instance());
    race(creatures, courts, alives);

    CHECK(creatures[0]->alive() == false);
    CHECK(courts[0] == Sand::instance());
    CHECK(courts[1] == Grass::instance());
    CHECK(courts[2] == Marsh::instance());

    destroyAll(creatures);
}

TEST_CASE("4", "") {

    vector<Creature*> creatures;
    vector<Ground*> courts;
    vector<string> alives;

    creatures.clear();
    courts.clear();
    creatures.push_back(new DuneBeetle("bug", 1));
    courts.push_back(Marsh::instance()); courts.push_back(Grass::instance());
    race(creatures, courts, alives);

    CHECK(creatures[0]->alive() == false);
    CHECK(courts[0] == Grass::instance());
    CHECK(courts[1] == Grass::instance());

    destroyAll(creatures);


    creatures.clear();
    courts.clear();
    creatures.push_back(new DuneBeetle("bug", 3));
    courts.push_back(Grass::instance()); courts.push_back(Marsh::instance());
    race(creatures, courts, alives);

    CHECK(creatures[0]->alive() == false);
    CHECK(courts[0] == Sand::instance());
    CHECK(courts[1] == Grass::instance());

    destroyAll(creatures);
}

#endif // NORMAL_MODE

