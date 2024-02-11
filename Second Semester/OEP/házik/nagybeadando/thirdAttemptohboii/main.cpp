#include <iostream>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include "Plant.hpp"
#include "Radiant.hpp"
using namespace std;

int createPlanet(const std::string fileName, std::vector<Plant*> &plants){
    ifstream f(fileName);
    if(f.fail()){
        std::cout << "Sowwy but I can't find the file o.o" << std::endl;
        exit(1);
    }

    int plantDB, dayDB, nut;
    std::string name;
    char type;

    f >> plantDB;
    plants.resize(plantDB);

    for(int i=0; i<plantDB; ++i){
        f >> name >> type >> nut;
        plants[i] = Plant::create(name, type, nut);
    }

    f >> dayDB;
    return dayDB;
}

void destroyRad(Radiant* &rad){
    if(rad->isAlpha()){
        Alpha::destroy();
    } else if(rad->isDelta()){
        Delta::destroy();
    } else if (rad->isNoRad()){
        NoRad::destroy();
    }
}

void daysLater(vector<Plant*> &plants, Radiant* &rad, int dayDB, std::string &strongestSurvivor, vector<std::string>& report){
    try{
        report.clear();
        report.push_back("NO RADIATION");
        while(dayDB > 0){
            int need = 0;

            for(Plant* p:plants){
                if(p->isAlive()){
                    need = p->transMute(need, rad);

                    std::string plant = "";
                    stringstream ss;

                    plant = plant + p->getName() + " ";
                    ss << p->getNut();

                    if(p->isPuffancs()){
                        plant = plant + "| puffancs \t|" + ss.str();
                    } else if(p->isDeltafa()){
                        plant = plant + "| deltafa \t|" + ss.str();
                    } else if(p->isParabokor()){
                        plant = plant + "| parabokor \t|" + ss.str();
                    }

                    report.push_back(plant);
                }
            }

            if(need >= 3){
                destroyRad(rad);
                rad = Alpha::Instance();
                report.push_back("ALPHA RADIATION");
            } else if(need <= -3){
                destroyRad(rad);
                rad = Delta::Instance();
                report.push_back("DELTA RADIATION");
            } else {
                destroyRad(rad);
                rad = NoRad::Instance();
                report.push_back("NO RADIATION");
            }

            dayDB--;
        }

        int nutMax = 0;
        std::string strongest;

        for(Plant* p : plants){
            if(p->isAlive() && p->getNut()>nutMax){
                strongest = p->getName();
                nutMax = p->getNut();
            }
        }

        if(nutMax == 0){
            strongestSurvivor = "There are no survivors..";
        } else{
            strongestSurvivor = "The strongest survivor is the " + strongest;
        }
    } catch(exception e){
        std::cout << e.what() << std::endl;
    }
}

void destroyAll(vector<Plant*> &plants, vector<std::string>& report){

    for(Plant* p : plants){
        delete p;
    }

    Alpha::destroy();
    Delta::destroy();
    NoRad::destroy();
}

std::string check(bool test){
    if(!test){
        return "oopsie";
    }

    return "allGood";
}

bool AllTestPassed(vector<std::string>& result, int testDB){
    int tests = 0;
    for(std::string s : result){
        if(s=="allGood"){
            tests++;
        }
    }

    if(tests == testDB){
        return true;
    }

    return false;
}

int main()
{
    //PLANT LIFE SIMULATION
    Radiant* rad = Radiant::create();

    std::vector<Plant*> plants;
    int days = createPlanet("input.txt", plants);

    std::string ss;
    vector<std::string> report;
    daysLater(plants, rad, days, ss, report);

    for(std::string s : report){
        std::cout << s << std::endl;
    }
    std::cout << "-------------------" << std::endl;
    std::cout << ss << std::endl;
    destroyAll(plants, report);


    /*
    //TEST CASES
    int test = 0;
    vector<std::string> checked;
    int l = false;

    std::vector<Plant*> testPlants;
    std::string testSS;
    vector<std::string> testReport;

    //empty file
    int dayz = createPlanet("input_empty.txt", testPlants);
    daysLater(testPlants, rad, days, testSS, testReport);
    checked.push_back(check(testReport.size() == 1)); test++;
    checked.push_back(check(testReport[0] == "NO RADIATION")); test++;
    checked.push_back(check(testSS == "There are no survivors..")); test++;
    destroyAll(testPlants, testReport);

    l = AllTestPassed(checked, test);
    if(l){
        std::cout << "ALL (" << test << ") test cases were succesfull!" << std::endl;
    } else { std::cout << "FAILED.. Big Time..";}
    */
}
