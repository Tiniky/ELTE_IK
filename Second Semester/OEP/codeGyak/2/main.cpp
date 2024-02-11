#include <iostream>
#include "Rational.h"

using namespace std;

int main()
{
    Rational c(1,2);
    Rational d(3,4);

    //c = c.add(d);
    c = c + d;

    std::cout << c;

    try
    {
        c = c.div(d);
    }
    catch(NullDivision e)
    {
        std::cout << "NullDivison :c";
    }

    return 0;
}
