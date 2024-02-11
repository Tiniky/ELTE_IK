#pragma once
#include <iostream>

class NullDivision : public std::exception{};

class Complex{
    private:
        double re, im;
    public:
        Complex(double _re, double _im) : re(_re), im(_im){

        }

        friend Complex operator+(const Complex &a, const Complex &b)
        {
            return Complex(a.re + b.re, a.im + b.im);
        }

        friend Complex operator-(const Complex &a, const Complex &b)
        {
            return Complex(a.re - b.re, a.im - b.im);
        }

        friend Complex operator*(const Complex &a, const Complex &b)
        {
            return Complex(a.re*b.re - a.im*b.im , a.re*b.im + a.im*b.re);
        }

        friend Complex operator/(const Complex &a, const Complex &b)
        {
            if(b.re == 0 && b.im == 0)
            {
                throw NullDivision();
            }

            return Complex((a.re*b.re + a.im*b.im)/(b.re*b.re + b.im*b.im),(a.im*b.re - a.re*b.im)/(b.re*b.re + b.im*b.im));
        }

        friend std::ostream& operator<<(std::ostream& o, Complex &a)
        {
            if(a.re == 0)
            {
                o << "(";
            }
            else
            {
                o << "(" << a.re;
            }
            if(a.im == 0)
            {
                o << ")";
            }
            else if(a.im == 1)
            {
                o << " + i)";
            }
            else if(a.im == -1)
            {
                o << " - i)";
            }
            else if(a.im < 0)
            {
                o << " - " << a.im*(-1) << "i)";
            }
            else
            {
                o << " + " << a.im << "i)";
            }

            return o;
        }

};
