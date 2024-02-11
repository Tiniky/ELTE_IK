#ifndef DIAGONAL_H_INCLUDED
#define DIAGONAL_H_INCLUDED

#pragma once
#include <vector>

class DifferentSize : public std::exception{};
class InvalidIndex : public std::exception{};
class ReferenceToNullPart : public std::exception{};

class Diagonal{
    private:
        std::vector<int> vec;
    public:
        Diagonal(int n) : vec(n,0)
        {

        }

        Diagonal(const std::vector<int> &v) : vec(v)
        {

        }

        friend Diagonal operator+(const Diagonal &a, const Diagonal &b)
        {
            if(a.vec.size() != b.vec.size())
            {
                throw DifferentSize();
            }

            Diagonal x(a.vec.size());

            for(int i = 0; i < c.vec.size(); i++)
            {
                c.vec[i] = a.vec[i] + b.vec[i];
            }

            return x;
        }

        friend Diagonal operator*(const Diagonal &a, const Diagonal &b)
        {
            if(a.vec.size() != b.vec.size())
            {
                throw DifferentSize();
            }

            Diagonal x(a.vec.size());

            for(int i = 0; i < c.vec.size(); i++)
            {
                c.vec[i] = a.vec[i] * b.vec[i];
            }

            return x;
        }


        int get(int x, int y) const
        {
            if(x >= vec.size() || y >= vec.size() || x < 0 || y < 0)
            {
                throw InvalidIndex();
            }
            else if(x == y)
            {
                return vec[x];
            }
            else
            {
                return 0;
            }
        }

        void set(int x, int y, int n)
        {
            if(x >= vec.size() || y >= vec.size() || x < 0 || y < 0)
            {
                throw InvalidIndex();
            }
            else if(x == y)
            {
                vec[x] = n;
            }
            else
            {
                throw ReferenceToNullPart();
            }
        }

};

#endif // DIAGONAL_H_INCLUDED
