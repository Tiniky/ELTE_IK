#ifndef RATOIONAL_H_INCLUDED
#define RATOIONAL_H_INCLUDED

#pragma once
#include <iostream>

class NullDivision : public std::exception{};

class Rational{
    private:
        int n,d;
    public:
        Rational(int _n = 0, int _d = 1) : n(_n), d(_d)
        {

        }

        Rational add(const Rational &b) const
        {
            Rational x(n* b.d + d * b.n, d* b.d);
            return x;
        }

        Rational sub(const Rational &b) const
        {
            Rational x(n* b.d - d * b.n, d* b.d);
            return x;
        }

        Rational mul(const Rational &b) const
        {
            Rational x(n * b.n, d * b.d);
            return x;
        }

        Rational div(const Rational &b) const
        {
            if(b.n == 0)
            {
                throw NullDivision();
            }

            Rational x(n* b.d, d* b.n);
            return x;
        }

        friend Rational operator+(const Rational &a, const Rational &b)
        {
            return Rational(a.n* b.d + a.d * b.n, a.d* b.d);
        }

        friend Rational operator-(const Rational &a, const Rational &b)
        {
            return Rational(a.n* b.d - a.d * b.n, a.d* b.d);
        }

        friend std::ostream& operator<<(std::ostream& o, Rational &a)
        {
            o << "(" << a.n << "/" << a.d << ")";
            return o;
        }
};

#endif // RATOIONAL_H_INCLUDED
