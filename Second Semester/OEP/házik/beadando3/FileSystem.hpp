#pragma once

#include <string>
#include <vector>
#include "Entry.hpp"

class FileSystem{
private:
    FileSystem(){}
    static FileSystem* inst;

public:
    std::vector<Entry*> entries;

    void addEntry(Entry* e) {
        entries.push_back(e);
    }

    static FileSystem* Inst(){
        if(inst == nullptr){
            inst = new FileSystem();
        }
        return inst;
    }

    static void destroy(){
        if(inst != nullptr){
            delete inst;
        }
    }

    ~FileSystem();
};
