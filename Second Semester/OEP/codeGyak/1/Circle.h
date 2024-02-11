#ifndef CIRCLE_H_INCLUDED
#define CIRCLE_H_INCLUDED

#pragma once
#include "Point.h"

class Circle{
    private:
        Point c;
        double r;
    public:
        Circle(const Point &p, double a){
            c = p;
            r = a;
        }

        bool tartalmaz(const Point &p) const
        {
            return c.distance(p) <= r;
        }
};

#endif // CIRCLE_H_INCLUDED
