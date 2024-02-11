#include <iostream>
#include "SeqInFile.hpp"

using namespace std;

int main()
{
    //1
    SeqInFile f("input.txt");

    f.Read();

    std::string minDate = f.napiadat.datum;
    int minGepen = f.napiadat.gepenOssz;

    while(f.st == SeqInFile::norm){
        if(minGepen > f.napiadat.gepenOssz){
            minGepen = f.napiadat.gepenOssz;
            minDate = f.napiadat.datum;
        }

        f.Read();
    }

    std::cout << minDate << std::endl;

    //2
    SeqInFile f2("input.txt");

    float betegek = 0;
    int DB = 0;

    f2.Read();

    while(f2.st == SeqInFile::norm){
        if(f2.napiadat.fertozottSzam >= 1000){
            betegek += f2.napiadat.fertozottSzam;
            DB++;
        }

        f2.Read();
    }

    std::cout << betegek/DB << std::endl;

    //3
    SeqInFile f3("input.txt");

    bool tobbM5k = false;
    bool masodszorTobbM5k = false;

    f3.Read();

    while(f3.st == SeqInFile::norm){
        if(f3.napiadat.fertozottSzam > 5000){
            if(!tobbM5k){
                tobbM5k = true;
            } else{
                masodszorTobbM5k = true;
            }
        }

        f3.Read();
    }

    if(masodszorTobbM5k){
        std::cout << "Igen" << std::endl;
    } else{
        std::cout << "Nem" << std::endl;
    }

    return 0;
}
