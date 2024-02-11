#pragma once

include "Store.hpp"
include <fstream>
include <iostream>
include <string>

class Costumer{

private:
    std::vector<std::string> list;

    void buy(Product *p, Department *d)
    {
        d->takeOutFromStock(p);
        std::cout << p->getName() << " " << p->getPrice() << std::endl;
    }

public:
    Costumer(std::string fileName)
    {
        std::ifstream f(fileName);

        std:: string s;
        while(f >> s){
            list.push_back(s);
        }
    }

    void goShopping(Store &st)
    {
        for(std::string productName : list)
        {
            Product *product;
            if(search(productName, s.foods, product))
            {
                buy(product, s.foods);
            }
            if(minsearch(productName, s.technical, product))
            {
                buy(product, s.technical);
            }
        }
    }

    bool search(std::string name, Department *d, Product* &p)
    {
        bool l = false;

        for(Product *p : d->stock)
        {
            if(name == p->getName())
            {
                l = true;
                product = p;
                break;
            }
        }

        return l;
    }

    bool minsearch(const std::string &name, Department* d, Product* &Product) const
    {
        bool l = false;
        int MIN;

        for(Product *p : d->stock)
        {
            if(p->getName() != name) continue;
            if(l)
            {
                if(MIN > p->getPrice())
                {
                    MIN = p->getPrice();
                    product = p;
                }
            }
            else{
                l = true;
                MIN = p->getPrice();
                product = p;
            }
        }

        return l;
    }
};
