#include <iostream>

using namespace std;
class teleAverem : public std::exception{};
class uresAverem : public std::exception{};

class Stack{
    private:
        int n,T;
        int A[T];
    public:
        Stack(int _n = 0, int _T = 100) : n(_n), T(_T)
        {

        }

        void push(int x)
        {
            if(n<T)
            {
                n++;
                A[n] = x;
            }
            else
                {
                    throw teleAverem;
                }
        }

        int pop()
        {
            if(n>0)
            {
                n--;
                return[n+1];
            }
            else
            {
                throw uresAverem;
            }
        }

        int top()
        {
            if(n>0)
            {
                return[n+1];
            }
            else
            {
                throw uresAverem;
            }
        }

        bool isEmpty()
        {
            if(n == 0)
                return true;
            else
                return false;
        }

};


int main()
{

}
