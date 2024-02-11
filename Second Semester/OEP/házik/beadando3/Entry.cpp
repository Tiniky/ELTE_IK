#include "Entry.hpp"

Library::~Library(){
    for(Entry* e: libentries){
        delete e;
    }
}

int Library::GetSize(){
    int sum = 0;
    for(Entry* e : libentries){
        sum += e->GetSize();
    }

    return sum;
}
