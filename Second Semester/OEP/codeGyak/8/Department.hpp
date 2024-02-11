#pragma once

#include "Product.hpp"
#include <vector>
#include <fstream>

class Department
{
public:
    std::vector<Product*> stock;

    Department(std::string fileName)
    {
        std::ifstream f(filename);
        std::string name;
        int price;

        while(f>>name>>price)
        {
            stock.push_back(new Product(name,price));
        }
    }

    void takeOutFromStock(Product *product)
    {
        bool productFound = false;
        int index = 0;

        while(index < stock.size() && !productFound)
        {
            if(stock[index] == product)
            {
                productFound = true;
            }
            index++;
        }
        index--;

        if(productFound)
        {
            stock.erase(stock.begin()+index);
        }
    }
}
