#pragma once

class Animal{
public:
    Animal(double w, bool l) : _weight(w), _male(l) {}

    virtual bool isLion() const {return false;}
    virtual bool isRhino() const {return false;}
    virtual bool isElephant() const {return false;}
    virtual ~Animal(){}

    double _weight;
    bool _male;
};

class Lion : public Animal{
public:
    Lion(double w, bool l) : Animal(w,l) {}
    bool isLion const override {return true;}
};

class Rhino : public Animal{
public:
    Rhino(double w, bool l, double h) : Animal(w,l), _horn(h) {}
    bool isRhino const override {return true;}

    double _horn;
};

class Elephant : public Animal{
public:
    Elephant(double w, bool l, double lt, double rt) : Animal(w,l), _leftTusk(lt), _rightTusk(rt) {}
    bool isElephant const override {return true;}

    double _leftTusk, _rightTusk;
};
