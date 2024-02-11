#pragma once

#include <iostream>

#include "Vaccine.hpp"
#include "Patient.hpp"

class Hospital
{
public:
    std::string name;
    std::vector<Vaccine*> vaccines;
    std::vector<Patient*> registered;
    Hospital();

    void Procure2(Vaccine* v)
    {
        vaccines.push_back(v);
    }

    void Procure(std::string vName)
    {
        if(vName == "Pfizer")
        {
            std::cout << "Vaccine Procured" << std::endl;
            vaccines.push_back(new Pfizer(10));
        }
        else if(vName == "Astra")
        {
            std::cout << "Vaccine Procured" << std::endl;
            vaccines.push_back(new Astra(10));
        }
        else if(vName == "Moderna")
        {
            std::cout << "Vaccine Procured" << std::endl;
            vaccines.push_back(new Moderna(10));
        }
        else
        {
            std::cout << "Vaccine cannot be procured" << std::endl;
        }
    }
    void Register(Patient* p)
    {
        bool l = false;
        for(Patient* e : registered)
        {
            if(e->TAJ == p->TAJ)
            {
                l = true;
                std::cout << "Patient already registered" << std::endl;
                break;
            }
        }
        if(!l)
        {
            std::cout << "Patient registered" << std::endl;
            registered.push_back(p);
        }
    }
    void Vaccinate(Patient* p, std::string vName/*, int date*/)
    {
        bool l1 = false;
        bool l2 = false;

        Vaccine* vaccine;

        for(Vaccine* e : vaccines)
        {
            if(e->Name() == vName /*&& e->expirationDate >= date*/)
            {
                l1 = true;
                vaccine = e;
                break;
            }
        }

        for(Patient* e : registered)
        {
            if(e->TAJ == p->TAJ)
            {
                l2 = true;
                break;
            }
        }

        if(l1 && l2)
        {
            //vaccines.erase(std::remove(vaccines.begin(), vaccines.end(), vaccine), vaccines.end());
            for(int i = 0; i<vaccines.size();i++)
            {
                if(vaccines[i] == vaccine)
                {
                    vaccines[i] = vaccines.back();
                    vaccines.pop_back();
                    //break;
                }
            }

            Vaccination* v = new Vaccination();
            v->vaccine = vaccine;
            p->vaccinations.push_back(v);
            std::cout << "Patient vaccinated" << std::endl;
        }
        else
        {
            std::cout << "Vaccine not found or Patient not registered" << std::endl;
        }
    }

    int NumOfMultiple()
    {
        int count = 0;
        for(Patient* e : registered)
        {
            if(e->NumOfVacc() >= 2)
            {
                count++;
            }
        }

        return count;
    }
    ~Hospital();
};
