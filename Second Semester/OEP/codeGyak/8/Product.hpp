#pragma once

#include <string>

class Product
{
private:
    std::string name;
    int price;
public:
    Product(std::string n, int p): name(n), price(p) {}

    std::string getName(){
        return name;
    }

    int getPrice(){
        return price;
    }
};


