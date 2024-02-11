#pragma once

#include <vector>

class Entry{
public:
    int _size = 0;

    Entry(){}
    virtual ~Entry(){}

    virtual int GetSize() = 0;
};

class File : public Entry{
public:
    File(int s) : Entry() {_size = s;}
    bool isFile(){return true;}

    int GetSize() override {return _size;}
};


class Library : public Entry{
private:
    bool _empty = true;

public:
    std::vector<Entry*> libentries;
    std::vector<int> sizes;

    Library() : Entry(){}
    bool isEmpty() {return _empty;}
    void addEntry(Entry* e) {
        _empty = false;
        libentries.push_back(e);
    }

    int GetSize() override;
    ~Library();
};
