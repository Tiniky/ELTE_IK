#include <iostream>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>

void read(const std::string &fileName, std::vector<std::string*> &nev, std::vector<char*> &tipus, std::vector<int*> &tapanyag, int* &days){
    std::ifstream f(fileName);
    if(f.fail()){
        std::cout << "File name error!" << std::endl;
        exit(1);
    }

    int plantDB, dayDB, nut;
    std::string line, name;
    char type;

    f >> plantDB;
    int i = 0;

    while(getline(f, line)){
        std::istringstream data(line);

        if(i == plantDB){
            data >> dayDB;
        } else {
            data >> name >> type >> nut;
            nev.push_back(&name);
            tipus.push_back(&type);
            tapanyag.push_back(&nut);
        i++;
        }

    days = &dayDB;
    }

}

int main(){

    std::vector<std::string*> nevee;
    std::vector<char*> tipus;
    std::vector<int*> kaja;
    int* napok = 0;

    read("input.txt", nevee, tipus, kaja, napok);

    std::cout << *napok << std::endl;

}
