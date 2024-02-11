#ifndef POINT_H_INCLUDED
#define POINT_H_INCLUDED

#pragma once
#include <cmath>

class Point{
    private:
        double x;
        double y;
    public:

        double getX()
        {
            return x;
        }

        double getY()
        {
            return y;
        }

        void setX(double a)
        {
            x = a;
        }

        void setY(double a)
        {
            y = a;
        }

        Point(double a, double b){
            x = a;
            y = b;
        }

        double tav(const Point &p) const
        {
            return sqrt(pow(x-p.x,2) + pow(y-p.y,2));
        }
};


#endif // POINT_H_INCLUDED
