#pragma once

#include <string>
#include <vector>

struct Item
{
    int pr;
    std::string data;

    Item(int p = 0, std::string s = "") : pr(p), data(s) {}
};

class PrQueue
{
    private:
        std::vector<Item> vec;
        int MaxIndex() const;
    public:
        void setEmpty();
        bool isEmpty();
        void add(const Item &i);
        Item getMax() const;
        Item remMax();
};
