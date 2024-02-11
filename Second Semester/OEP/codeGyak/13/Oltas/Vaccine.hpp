#pragma once

#include <string>

class Vaccine
{
private:
    /* data */
public:
    int expirationDate;
    Vaccine(int d): expirationDate(d) {}

    virtual std::string Name() = 0;
    virtual int Repetition() = 0;

    virtual ~Vaccine(){}
};

class Pfizer : public Vaccine
{
    public:

    std::string Name() override{
        return "Pfizer";
    }

    int Repetition() override{
        return 28;
    }

    Pfizer(int d): Vaccine(d) {}
};

class Astra : public Vaccine
{
    public:

    std::string Name() override{
        return "Astra";
    }

    int Repetition() override{
        return 21;
    }

    Astra(int d): Vaccine(d) {}
};

class Moderna : public Vaccine
{
    public:

    std::string Name() override{
        return "Moderna";
    }

    int Repetition() override{
        return 84;
    }

    Moderna(int d): Vaccine(d) {}
};