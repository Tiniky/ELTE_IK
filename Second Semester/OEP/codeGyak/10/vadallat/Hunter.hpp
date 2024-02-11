#pragma once

#include "Trophy.hpp"
#include <vector>

class Hunter{
public:
    std::string name;
    int age;
    std::vector<Trophy*> trophies;

    Hunter(std::string n, int a): name(n), age(a) {}

    void capture(Animal* a, std::string p, std::string d);
    int countMaleLions() const;
    float maxHornWeightRatio() const;
    bool searchEqualTusks() const;

    ~Hunter();
};
