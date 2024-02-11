#pragma once

class Plant{
protected:
    int ripeningTime;
    Plant(int r) : ripeningTime(r) {}

public:
    virtual bool isVegetable() const {return false;}
    virtual bool isFlower() const {return false;}
    int getRipeningTime() const {return ripeningTime;}

    virtual ~Plant() {}

};

class Vegetable : public Plant{
protected:
    Vegetable(int r) : Plant(r) {}

public:
    bool isVegetable() const override {return false;}
};

class Flower : public Plant{
protected:
    Flower(int r) : Plant(r) {}

public:
    bool isFlower() const override {return false;}
};

class Potato : public Vegetable{
private:
    static Potato* _inst;
    Potato() : Vegetable(5) {}

public:
    static Potato* inst();
    static void destroy();
};

class Pea : public Vegetable{
private:
    static Pea* _inst;
    Pea() : Vegetable(3) {}

public:
    static Pea* inst();
    static void destroy();
};

class Onion : public Vegetable{
private:
    static Onion* _inst;
    Onion() : Vegetable(4) {}

public:
    static Onion* inst();
    static void destroy();
};

class Rose : public Flower{
private:
    static Rose* _inst;
    Rose() : Vegetable(8) {}

public:
    static Rose* inst();
    static void destroy();
};

class Carnation : public Flower{
private:
    static Carnation* _inst;
    Carnation() : Vegetable(10) {}

public:
    static Carnation* inst();
    static void destroy();
};

class Tulip : public Flower{
private:
    static Tulip* _inst;
    Tulip() : Vegetable(7) {}

public:
    static Tulip* inst();
    static void destroy();
};
