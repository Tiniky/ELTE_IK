#pragma once

#include "Department.hpp"

class Store
{
public:
    Department *foods;
    Department *technical;

    Store(std::string foodsFile, std::string technicalFile)
    {
        foods = new Department(foodsFile);
        technical = new Department(technicalFile);
    }

    ~Store()
    {
        delete foods;
        delete technical;
    }
};
