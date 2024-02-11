#pragma once

#include<vector>
#include "Vaccination.hpp"

class Patient
{
private:
    /* data */
public:
    std::vector<Vaccination*> vaccinations;
    std::string TAJ;

    int NumOfVacc()
    {
        return vaccinations.size();
    }
    Patient(std::string t): TAJ(t) {}
    ~Patient();
};
