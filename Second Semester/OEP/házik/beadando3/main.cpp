#include <iostream>

#include "FileSystem.hpp"
#include "Entry.hpp"

using namespace std;

int main()
{
    FileSystem* fs = FileSystem::Inst();


    Library* konyvtar1 = new Library();
    Library* konyvtar2 = new Library();

    File* file1 = new File(2);
    File* file2 = new File(10);
    File* file3 = new File(27);
    File* file4 = new File(6);
    File* file5 = new File(4);
    File* file6 = new File(3);

    konyvtar1->addEntry(konyvtar2);
    fs->addEntry(konyvtar1);

    konyvtar2->addEntry(file1);
    konyvtar2->addEntry(file2);
    konyvtar2->addEntry(file3);
    konyvtar2->addEntry(file4);
    konyvtar1->addEntry(file5);
    konyvtar1->addEntry(file6);

    std::cout << file3->GetSize() << std::endl;
    std::cout << konyvtar1->GetSize() << std::endl;
    std::cout << konyvtar2->GetSize() << std::endl;


    konyvtar1->~Library();
    konyvtar2->~Library();
    fs->~FileSystem();
    fs->destroy();
}
