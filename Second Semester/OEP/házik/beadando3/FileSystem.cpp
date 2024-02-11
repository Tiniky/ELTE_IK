#include "FileSystem.hpp"

FileSystem* FileSystem::inst = nullptr;

FileSystem::~FileSystem(){
    for(Entry* e: entries){
        delete e;
    }
}
